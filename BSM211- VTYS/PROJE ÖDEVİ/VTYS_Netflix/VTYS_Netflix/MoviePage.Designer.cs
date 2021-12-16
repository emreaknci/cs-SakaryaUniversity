namespace VTYS_Netflix
{
    partial class MoviePage
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataMovie = new System.Windows.Forms.DataGridView();
            this.btnDuzenle = new System.Windows.Forms.Button();
            this.btnSil = new System.Windows.Forms.Button();
            this.btnEkle = new System.Windows.Forms.Button();
            this.cmbYonetmen = new System.Windows.Forms.ComboBox();
            this.txtAd = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dateTimeFilm = new System.Windows.Forms.DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbCalisan = new System.Windows.Forms.ComboBox();
            this.btnFilmTuru = new System.Windows.Forms.Button();
            this.btnFilmOyuncu = new System.Windows.Forms.Button();
            this.txtFilmAra = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cmbYonetmenAra = new System.Windows.Forms.ComboBox();
            this.btnAra = new System.Windows.Forms.Button();
            this.btnGoster = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataMovie)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataMovie
            // 
            this.dataMovie.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataMovie.BackgroundColor = System.Drawing.Color.Red;
            this.dataMovie.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataMovie.Location = new System.Drawing.Point(12, 217);
            this.dataMovie.Name = "dataMovie";
            this.dataMovie.RowHeadersWidth = 51;
            this.dataMovie.RowTemplate.Height = 24;
            this.dataMovie.Size = new System.Drawing.Size(802, 324);
            this.dataMovie.TabIndex = 91;
            this.dataMovie.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataMovie_CellClick);
            // 
            // btnDuzenle
            // 
            this.btnDuzenle.BackColor = System.Drawing.Color.Black;
            this.btnDuzenle.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDuzenle.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnDuzenle.ForeColor = System.Drawing.Color.Red;
            this.btnDuzenle.Location = new System.Drawing.Point(835, 349);
            this.btnDuzenle.Name = "btnDuzenle";
            this.btnDuzenle.Size = new System.Drawing.Size(170, 60);
            this.btnDuzenle.TabIndex = 90;
            this.btnDuzenle.Text = "DÜZENLE";
            this.btnDuzenle.UseVisualStyleBackColor = false;
            this.btnDuzenle.Click += new System.EventHandler(this.btnDuzenle_Click);
            // 
            // btnSil
            // 
            this.btnSil.BackColor = System.Drawing.Color.Black;
            this.btnSil.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnSil.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnSil.ForeColor = System.Drawing.Color.Red;
            this.btnSil.Location = new System.Drawing.Point(835, 283);
            this.btnSil.Name = "btnSil";
            this.btnSil.Size = new System.Drawing.Size(170, 60);
            this.btnSil.TabIndex = 89;
            this.btnSil.Text = "SİL";
            this.btnSil.UseVisualStyleBackColor = false;
            this.btnSil.Click += new System.EventHandler(this.btnSil_Click);
            // 
            // btnEkle
            // 
            this.btnEkle.BackColor = System.Drawing.Color.Black;
            this.btnEkle.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnEkle.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnEkle.ForeColor = System.Drawing.Color.Red;
            this.btnEkle.Location = new System.Drawing.Point(835, 217);
            this.btnEkle.Name = "btnEkle";
            this.btnEkle.Size = new System.Drawing.Size(170, 60);
            this.btnEkle.TabIndex = 88;
            this.btnEkle.Text = "EKLE";
            this.btnEkle.UseVisualStyleBackColor = false;
            this.btnEkle.Click += new System.EventHandler(this.btnEkle_Click);
            // 
            // cmbYonetmen
            // 
            this.cmbYonetmen.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbYonetmen.FormattingEnabled = true;
            this.cmbYonetmen.Location = new System.Drawing.Point(174, 118);
            this.cmbYonetmen.Name = "cmbYonetmen";
            this.cmbYonetmen.Size = new System.Drawing.Size(244, 28);
            this.cmbYonetmen.TabIndex = 98;
            // 
            // txtAd
            // 
            this.txtAd.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.txtAd.Location = new System.Drawing.Point(171, 35);
            this.txtAd.Name = "txtAd";
            this.txtAd.Size = new System.Drawing.Size(247, 26);
            this.txtAd.TabIndex = 97;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(7, 121);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(133, 25);
            this.label2.TabIndex = 95;
            this.label2.Text = "YÖNETMEN";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(7, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 25);
            this.label1.TabIndex = 94;
            this.label1.Text = "AD";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(7, 77);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(146, 25);
            this.label3.TabIndex = 100;
            this.label3.Text = "ÇIKIŞ TARİHİ";
            // 
            // dateTimeFilm
            // 
            this.dateTimeFilm.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.dateTimeFilm.Location = new System.Drawing.Point(173, 76);
            this.dateTimeFilm.Name = "dateTimeFilm";
            this.dateTimeFilm.Size = new System.Drawing.Size(245, 26);
            this.dateTimeFilm.TabIndex = 101;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(7, 164);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(110, 25);
            this.label4.TabIndex = 102;
            this.label4.Text = "EKLEYEN";
            // 
            // cmbCalisan
            // 
            this.cmbCalisan.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbCalisan.FormattingEnabled = true;
            this.cmbCalisan.Location = new System.Drawing.Point(173, 165);
            this.cmbCalisan.Name = "cmbCalisan";
            this.cmbCalisan.Size = new System.Drawing.Size(244, 28);
            this.cmbCalisan.TabIndex = 103;
            // 
            // btnFilmTuru
            // 
            this.btnFilmTuru.BackColor = System.Drawing.Color.Black;
            this.btnFilmTuru.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnFilmTuru.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnFilmTuru.ForeColor = System.Drawing.Color.Red;
            this.btnFilmTuru.Location = new System.Drawing.Point(835, 415);
            this.btnFilmTuru.Name = "btnFilmTuru";
            this.btnFilmTuru.Size = new System.Drawing.Size(170, 60);
            this.btnFilmTuru.TabIndex = 105;
            this.btnFilmTuru.Text = "FİLM TÜRÜ EKLE/SİL";
            this.btnFilmTuru.UseVisualStyleBackColor = false;
            this.btnFilmTuru.Click += new System.EventHandler(this.btnFilmTuru_Click);
            // 
            // btnFilmOyuncu
            // 
            this.btnFilmOyuncu.BackColor = System.Drawing.Color.Black;
            this.btnFilmOyuncu.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnFilmOyuncu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnFilmOyuncu.ForeColor = System.Drawing.Color.Red;
            this.btnFilmOyuncu.Location = new System.Drawing.Point(835, 481);
            this.btnFilmOyuncu.Name = "btnFilmOyuncu";
            this.btnFilmOyuncu.Size = new System.Drawing.Size(170, 60);
            this.btnFilmOyuncu.TabIndex = 106;
            this.btnFilmOyuncu.Text = "OYUNCU EKLE/SİL";
            this.btnFilmOyuncu.UseVisualStyleBackColor = false;
            this.btnFilmOyuncu.Click += new System.EventHandler(this.btnFilmOyuncu_Click);
            // 
            // txtFilmAra
            // 
            this.txtFilmAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.txtFilmAra.Location = new System.Drawing.Point(465, 173);
            this.txtFilmAra.Name = "txtFilmAra";
            this.txtFilmAra.Size = new System.Drawing.Size(259, 26);
            this.txtFilmAra.TabIndex = 109;
            this.txtFilmAra.TextChanged += new System.EventHandler(this.txtFilmAra_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(460, 133);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(250, 25);
            this.label6.TabIndex = 107;
            this.label6.Text = "FİLM ADINA GÖRE ARA";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Red;
            this.groupBox1.Controls.Add(this.txtAd);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cmbYonetmen);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cmbCalisan);
            this.groupBox1.Controls.Add(this.dateTimeFilm);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(447, 199);
            this.groupBox1.TabIndex = 110;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "FİLM BİLGİLERİ";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(460, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(264, 25);
            this.label5.TabIndex = 111;
            this.label5.Text = "YÖNETMENE GÖRE ARA";
            // 
            // cmbYonetmenAra
            // 
            this.cmbYonetmenAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbYonetmenAra.FormattingEnabled = true;
            this.cmbYonetmenAra.Location = new System.Drawing.Point(465, 86);
            this.cmbYonetmenAra.Name = "cmbYonetmenAra";
            this.cmbYonetmenAra.Size = new System.Drawing.Size(259, 28);
            this.cmbYonetmenAra.TabIndex = 112;
            // 
            // btnAra
            // 
            this.btnAra.BackColor = System.Drawing.Color.Black;
            this.btnAra.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnAra.ForeColor = System.Drawing.Color.Red;
            this.btnAra.Location = new System.Drawing.Point(731, 88);
            this.btnAra.Name = "btnAra";
            this.btnAra.Size = new System.Drawing.Size(83, 28);
            this.btnAra.TabIndex = 113;
            this.btnAra.Text = "ARA";
            this.btnAra.UseVisualStyleBackColor = false;
            this.btnAra.Click += new System.EventHandler(this.btnAra_Click);
            // 
            // btnGoster
            // 
            this.btnGoster.BackColor = System.Drawing.Color.Black;
            this.btnGoster.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnGoster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnGoster.ForeColor = System.Drawing.Color.Red;
            this.btnGoster.Location = new System.Drawing.Point(835, 151);
            this.btnGoster.Name = "btnGoster";
            this.btnGoster.Size = new System.Drawing.Size(170, 60);
            this.btnGoster.TabIndex = 114;
            this.btnGoster.Text = "TÜMÜNÜ GÖSTER";
            this.btnGoster.UseVisualStyleBackColor = false;
            this.btnGoster.Click += new System.EventHandler(this.btnGoster_Click);
            // 
            // MoviePage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Red;
            this.ClientSize = new System.Drawing.Size(1017, 553);
            this.Controls.Add(this.btnGoster);
            this.Controls.Add(this.btnAra);
            this.Controls.Add(this.cmbYonetmenAra);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.txtFilmAra);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.btnFilmOyuncu);
            this.Controls.Add(this.btnFilmTuru);
            this.Controls.Add(this.dataMovie);
            this.Controls.Add(this.btnDuzenle);
            this.Controls.Add(this.btnSil);
            this.Controls.Add(this.btnEkle);
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "MoviePage";
            this.Text = "FilmPage";
            this.Load += new System.EventHandler(this.MoviePage_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataMovie)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dataMovie;
        private System.Windows.Forms.Button btnDuzenle;
        private System.Windows.Forms.Button btnSil;
        private System.Windows.Forms.Button btnEkle;
        private System.Windows.Forms.ComboBox cmbYonetmen;
        private System.Windows.Forms.TextBox txtAd;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dateTimeFilm;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbCalisan;
        private System.Windows.Forms.Button btnFilmTuru;
        private System.Windows.Forms.Button btnFilmOyuncu;
        private System.Windows.Forms.TextBox txtFilmAra;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cmbYonetmenAra;
        private System.Windows.Forms.Button btnAra;
        private System.Windows.Forms.Button btnGoster;
    }
}