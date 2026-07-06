<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('M_menu');
		$this->load->model('M_penjualan');
		$this->load->model('M_detail_penjualan');
		$this->load->model('M_kategori');
	}

	public function index() {
		$data['menus'] = $this->M_menu->lihat_aktif();
		
		$data['kategori'] = $this->M_kategori->lihat();

		$this->load->view('home/index', $data);
	}

	public function checkout() {
		if ($this->input->is_ajax_request()) {
			$nama_pemesan = $this->input->post('nama_pemesan');
			$no_meja = $this->input->post('no_meja');
			$jenis_order = $this->input->post('jenis_order');
			$metode_pembayaran = $this->input->post('metode_pembayaran');
			$cart = $this->input->post('cart'); // JSON string or array
			
			if (is_string($cart)) {
				$cart = json_decode($cart, true);
			}

			if (empty($nama_pemesan) || empty($cart)) {
				ob_clean();
				error_reporting(0);
				header('Content-Type: application/json');
				echo json_encode(['status' => 'error', 'message' => 'Data tidak lengkap']);
				exit;
			}

			// Generate no_penjualan (e.g., PJtimestamp)
			$no_penjualan = 'PJ' . time();
			
			$total = 0;
			foreach ($cart as $item) {
				$total += $item['sub_total'];
			}

			date_default_timezone_set('Asia/Jakarta');
			
			$data_penjualan = [
				'no_penjualan' => $no_penjualan,
				'atas_nama' => $nama_pemesan,
				'no_meja' => $no_meja ? $no_meja : '',
				'jenis_order' => $jenis_order ? $jenis_order : 'Dine-in',
				'metode_pembayaran' => $metode_pembayaran,
				'status' => ($metode_pembayaran == 'QRIS') ? 'Sudah Dibayar' : 'Belum Bayar',
				'tgl_penjualan' => date('d/m/Y'),
				'jam_penjualan' => date('H:i:s'),
				'total' => $total,
				'nama_kasir' => 'Customer'
			];

			$insert_penjualan = $this->M_penjualan->tambah($data_penjualan);

			if ($insert_penjualan) {
				$data_detail = [];
				foreach ($cart as $item) {
					$data_detail[] = [
						'no_penjualan' => $no_penjualan,
						'nama_menu' => $item['nama_menu'],
						'harga_menu' => $item['harga_menu'],
						'jumlah_menu' => $item['jumlah_menu'],
						'sub_total' => $item['sub_total']
					];
				}
				
				// Insert batch because M_detail_penjualan->tambah() uses insert_batch
				$this->M_detail_penjualan->tambah($data_detail);

				ob_clean();
				error_reporting(0);
				header('Content-Type: application/json');
				echo json_encode(['status' => 'success', 'message' => 'Pesanan berhasil dibuat!', 'no_penjualan' => $no_penjualan]);
				exit;
			} else {
				ob_clean();
				error_reporting(0);
				header('Content-Type: application/json');
				echo json_encode(['status' => 'error', 'message' => 'Gagal membuat pesanan']);
				exit;
			}
		} else {
			show_404();
		}
	}
}
