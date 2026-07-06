<?php $this->load->view('partials/header'); ?>
<?php $this->load->view('partials/sidebar'); ?>

<!-- PAGE HEADER -->
<div class="page-header">
  <div>
    <div class="page-title">📱 Beranda</div>
    <div class="page-subtitle">Sistem Informasi Analitik & Prediksi Stok Lestari iPhone</div>
  </div>
</div>

<!-- ANALYTICS CARDS -->
<div class="results-grid animate-in" style="margin-bottom: 24px;">
  <!-- Card 1: Total Sales -->
  <div class="result-card green">
    <div class="card-header">
      <div class="card-series">Transaksi Penjualan</div>
      <div class="label-badge green">DATABASE</div>
    </div>
    <div class="metric-row" style="grid-template-columns: 1fr;">
      <div class="metric" style="display: flex; align-items: center; justify-content: space-between;">
        <div>
          <div class="metric-label">Total Record</div>
          <div class="metric-val green"><?= $total_penjualan ?></div>
          <div class="metric-unit">transaksi terdaftar</div>
        </div>
        <div style="font-size: 24px;">📊</div>
      </div>
    </div>
  </div>

  <!-- Card 2: Total iPhone -->
  <div class="result-card green">
    <div class="card-header">
      <div class="card-series">Model iPhone</div>
      <div class="label-badge green">MASTER DATA</div>
    </div>
    <div class="metric-row" style="grid-template-columns: 1fr;">
      <div class="metric" style="display: flex; align-items: center; justify-content: space-between;">
        <div>
          <div class="metric-label">Jumlah Tipe</div>
          <div class="metric-val blue"><?= $total_iphone ?></div>
          <div class="metric-unit">tipe aktif</div>
        </div>
        <div style="font-size: 24px;">📱</div>
      </div>
    </div>
  </div>

  <!-- Card 3: Last Run & Avg MAPE -->
  <div class="result-card yellow">
    <div class="card-header">
      <div class="card-series">Akurasi & Run Terakhir</div>
      <div class="label-badge yellow">ENGINE STATE</div>
    </div>
    <div class="metric-row" style="grid-template-columns: 1fr 1fr; gap: 8px;">
      <div class="metric">
        <div class="metric-label">Avg MAPE Error</div>
        <div class="metric-val yellow"><?= $avg_mape ?></div>
        <div class="metric-unit">error rata-rata</div>
      </div>
      <div class="metric">
        <div class="metric-label">Run Terakhir</div>
        <div style="font-size: 13px; font-family: var(--font-mono); font-weight: 700; color: var(--text-primary); margin-top: 5px;">
          <?= $last_run ?>
        </div>
        <div class="metric-unit" style="margin-top: 5px;">waktu hitung</div>
      </div>
    </div>
  </div>
</div>

<!-- RECOMMENDATIONS SECTION -->
<div class="section-title">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
  Rekomendasi Prioritas Stok & Peramalan Terkini
</div>

<?php if (!empty($recommendations)) : ?>
  <!-- Hero Priority Alert (Rank 1) -->
  <div style="background: var(--accent-blue-subtle); border: 1px solid var(--accent-blue)33; border-radius: var(--radius-lg); padding: 16px 20px; margin-bottom: 20px; display: flex; align-items: center; gap: 16px;" class="animate-in">
    <div style="font-size: 28px;">⭐</div>
    <div>
      <div style="font-weight: 700; color: var(--accent-blue); font-size: 14px; margin-bottom: 2px;">Prioritas Pengadaan Utama</div>
      <div style="font-size: 13px; color: var(--text-primary);">
        Model <strong><?= $recommendations[0]->nama_tipe ?></strong> menempati prioritas pengadaan tertinggi untuk periode peramalan <strong><?= $recommendations[0]->bulan_prediksi ?></strong>. 
        Saran suplai stok: <strong><?= $recommendations[0]->saran_stok ?> unit</strong> (Forecast: <?= round($recommendations[0]->nilai_sma) ?> unit, akurasi MAPE: <?= number_format($recommendations[0]->nilai_mape, 1) ?>%).
      </div>
      <div style="font-size: 11px; color: var(--text-muted); margin-top: 4px; font-family: var(--font-mono);">
        Fokuskan alokasi modal dan display toko pada produk prioritas ini untuk memaksimalkan ROI dan perputaran inventaris.
      </div>
    </div>
  </div>

  <!-- Recommendations Table -->
  <div class="table-card animate-in">
    <div class="table-toolbar">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
      rekomendasi_prioritas_stok.csv
      <span style="color:var(--text-muted)">·</span>
      <span>Target Bulan: <?= $recommendations[0]->bulan_prediksi ?></span>
    </div>
    <div style="overflow-x: auto;">
      <table class="data-table">
        <thead>
          <tr>
            <th style="width: 80px; text-align: center;">Peringkat</th>
            <th>Tipe iPhone</th>
            <th>Bulan Target</th>
            <th style="text-align: right;">Prediksi (unit)</th>
            <th style="text-align: right;">Saran Stok (unit)</th>
            <th>Akurasi Peramalan</th>
            <th>Catatan & Tindakan</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($recommendations as $row) : 
            $cls = 'red';
            $badge = '🔴 Risiko';
            $green_th = $this->config->item('mape_green');
            $yellow_th = $this->config->item('mape_yellow');

            if ($row->nilai_mape <= $green_th) {
                $cls = 'green';
                $badge = '🟢 Tinggi';
            } elseif ($row->nilai_mape <= $yellow_th) {
                $cls = 'yellow';
                $badge = '🟡 Moderat';
            }
          ?>
            <tr>
              <td style="text-align: center; font-weight: 700; font-family: var(--font-mono);">
                <?php if ($row->peringkat == 1) : ?>
                  🏆 1
                <?php else : ?>
                  #<?= $row->peringkat ?>
                <?php endif; ?>
              </td>
              <td style="font-weight: 600; color: var(--text-primary);"><?= $row->nama_tipe ?></td>
              <td style="font-family: var(--font-mono);"><?= $row->bulan_prediksi ?></td>
              <td style="text-align: right; font-family: var(--font-mono); font-weight: 600; color: var(--accent-blue);">
                <?= round($row->nilai_sma) ?>
              </td>
              <td style="text-align: right; font-family: var(--font-mono); font-weight: 700; color: var(--green);">
                <?= $row->saran_stok ?>
              </td>
              <td>
                <span class="label-badge <?= $cls ?>" style="font-size: 10px; font-weight: bold;">
                  <?= $badge ?> (Error: <?= number_format($row->nilai_mape, 1) ?>%)
                </span>
              </td>
              <td style="font-size: 12px; color: var(--text-secondary); max-width: 300px; line-height: 1.4;">
                <?= $row->keterangan ?>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>
<?php else : ?>
  <!-- Empty State -->
  <div class="table-card animate-in">
    <div class="empty-state">
      <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      <p>Rekomendasi stok belum tersedia</p>
      <small>Jalankan proses peramalan di menu <strong>Prediksi Penjualan</strong> terlebih dahulu.</small>
    </div>
  </div>
<?php endif; ?>

<?php $this->load->view('partials/footer'); ?>
