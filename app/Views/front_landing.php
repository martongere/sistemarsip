<?= $this->extend('layoutfront'); ?>
<?= $this->section('content'); ?>
<div class="row text-center mb-4">
    <h1>Selamat Datang di Website Informasi BKD Kabupaten Sikka!</h1>
    <p>Sebagai lembaga baru yang mengemban amanat sebagai pengelola manajemen kepegawaian daerah, Badan Kepegawaian Daerah menata diri dengan melakukan penataan diri baik dari segi sistem, personil, maupun pelayanannya dengan mengacu pada visi dan misinya yang telah ditetapkan dan dijabarkan dalam program-program kerjanya.</p>
</div>
<div class="row aligned-row">
    <div class="col-md-6 col-sm-6 widget p-md">
        <div class="">
            <h3>Visi</h3>
            <p>MEWUJUDKAN APARATUR YANG PROFESIONAL, DISIPLIN, JUJUR, HANDAL, DAN BERJIWA MELAYANI”.</p>
Visi tersebut di atas mempunyai makna sebagai berikut :
<br>1. Mewujudkan Aparatur Yang Profesional
Memiliki kompetensi di bidangnya, dalam pengabdiannya mengutamakan dan mengedepankan prinsip-prinsip dasar keilmuan, memiliki integritas yang tinggi dalam mengemban Visi dan Misi;
<br>2. Disiplin
Mengandung pengertian bahwa seluruh pegawai memiliki kesadaran taat dan patuh terhadap aturan/ ketentuan yang berlaku.
<br>3. Jujur
Mengandung arti yaitu menyelesaikan pekerjaan sesuai dengan ketentuan dan fenomena (realita) yang ada.
<br>4. Handal
adalah bahwa Organisasi Badan Kepegawaian Kota Kupang berisikan aparat yang memiliki ilmu pengetahuan, kemampuan dan kecakapan yang memadai, kompeten serta memiliki tanggung jawab di bidangnya dalam mengelola atau mengurus pegawai mulai dari perencanaan pegawai, mengorganisasikan, menggerakkan, mengontrol serta mengevaluasi pegawai agar dapat memberikan kontribusi sebesar-besarnya kepada organisasi untuk mencapai Visi dan Misi Kota Kupang ;
<br>5. Berjiwa Melayani
Mengandung pengertian bahwa melaksanakan pekerjaan tetap sasaran, tepat fungsi dan tepat waktu tanpa mengharapkan imbalan.. .</p>
        </div>
    </div>
    <!-- <div class="clearfix visible-lg"></div> -->
    <div class="col-md-6 col-sm-6">
        <div class="widget p-md">
            <h3>Misi</h3>
            <p>1. Meningkatkan kualitas pelayanan administrasi kepegawaian yang baik ;
<br>2. Melaksanakan pembinaan pegawai;
<br>3.           Meningkatkan kesejahteraan pegawai dan melaksanakan pengembangan pegawai serta mengelola sistem informasi manajemen kepegawaian</p>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            
        </div>
    </div>
</div>
<div class="row">
    <h2>INFORMASI</h2>

    <?php foreach ($informasi as $row) : ?>
        <div class="col-12">
            <div class="widget p-md">
                <h4><?= $row->informasi_judul ?></h4>
                <small>
                    <?= $row->informasi_waktu ?>
                </small>
                <p><?= $row->informasi_isi ?></p>
                <?php if ($row->informasi_dokumen != null) : ?>
                    <hr>
                    <a href="<?= base_url('assets/files/' . $row->informasi_dokumen) ?>">Download file</a>
                <?php endif; ?>
            </div>
        </div>
    <?php endforeach ?>
    <?= $pager->links() ?>
</div>
<?= $this->endSection(); ?>