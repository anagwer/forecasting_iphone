<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Beranda extends CI_Controller {

    public function __construct() {
        parent::__construct();
        if (!$this->session->userdata('login')) {
            redirect('login');
        }
        $this->load->model('M_penjualan', 'm_penjualan');
        $this->load->model('M_iphone', 'm_iphone');
        $this->load->model('M_prediksi', 'm_prediksi');
        $this->load->model('M_rekomendasi', 'm_rekomendasi');
        $this->data['aktif'] = 'beranda';
    }

    public function index() {
        $this->data['title'] = 'Beranda';
        
        // Compute general metrics for analytics cards
        $this->data['total_penjualan'] = $this->m_penjualan->jumlah();
        $this->data['total_iphone'] = $this->m_iphone->jumlah();
        
        // Fetch latest prediction date and average MAPE
        $this->db->select('created_at, nilai_mape');
        $this->db->from('prediksi');
        $this->db->order_by('created_at', 'DESC');
        $preds = $this->db->get()->result();

        if (count($preds) > 0) {
            $this->data['last_run'] = date('H:i, d M Y', strtotime($preds[0]->created_at));
            
            $mape_sum = 0;
            foreach ($preds as $p) {
                $mape_sum += $p->nilai_mape;
            }
            $this->data['avg_mape'] = number_format($mape_sum / count($preds), 1) . '%';
        } else {
            $this->data['last_run'] = 'Belum Ada';
            $this->data['avg_mape'] = '—';
        }

        // Get priority recommendations (sorted by rank)
        $this->data['recommendations'] = $this->m_rekomendasi->get_latest_recommendations();

        // Load dashboard view
        $this->load->view('beranda', $this->data);
    }
}
