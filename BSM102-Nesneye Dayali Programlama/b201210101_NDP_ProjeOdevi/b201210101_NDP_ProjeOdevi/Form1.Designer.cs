
namespace b201210101_NDP_ProjeOdevi
{
    partial class Form1
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.btnBasla = new System.Windows.Forms.Button();
            this.sureLabel = new System.Windows.Forms.Label();
            this.sayacLabel = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.pictureBox = new System.Windows.Forms.PictureBox();
            this.listBoxNarenciye = new System.Windows.Forms.ListBox();
            this.listBoxKati = new System.Windows.Forms.ListBox();
            this.btnNarenciye = new System.Windows.Forms.Button();
            this.btnKati = new System.Windows.Forms.Button();
            this.lblToplamNarenciye = new System.Windows.Forms.Label();
            this.lblToplamKati = new System.Windows.Forms.Label();
            this.lblToplamMeyve = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
            this.SuspendLayout();
            // 
            // btnBasla
            // 
            this.btnBasla.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnBasla.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBasla.ForeColor = System.Drawing.Color.MediumBlue;
            this.btnBasla.Location = new System.Drawing.Point(12, 241);
            this.btnBasla.Name = "btnBasla";
            this.btnBasla.Size = new System.Drawing.Size(223, 75);
            this.btnBasla.TabIndex = 0;
            this.btnBasla.Text = "BAŞLAT";
            this.btnBasla.UseVisualStyleBackColor = false;
            this.btnBasla.Click += new System.EventHandler(this.btnBasla_Click);
            // 
            // sureLabel
            // 
            this.sureLabel.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.sureLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sureLabel.ForeColor = System.Drawing.Color.MediumBlue;
            this.sureLabel.Location = new System.Drawing.Point(12, 340);
            this.sureLabel.Name = "sureLabel";
            this.sureLabel.Size = new System.Drawing.Size(223, 75);
            this.sureLabel.TabIndex = 1;
            this.sureLabel.Text = "SÜRE";
            this.sureLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // sayacLabel
            // 
            this.sayacLabel.BackColor = System.Drawing.Color.White;
            this.sayacLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sayacLabel.ForeColor = System.Drawing.Color.MediumBlue;
            this.sayacLabel.Location = new System.Drawing.Point(12, 418);
            this.sayacLabel.Name = "sayacLabel";
            this.sayacLabel.Size = new System.Drawing.Size(223, 75);
            this.sayacLabel.TabIndex = 2;
            this.sayacLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick_1);
            // 
            // pictureBox
            // 
            this.pictureBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.pictureBox.Location = new System.Drawing.Point(12, 12);
            this.pictureBox.Name = "pictureBox";
            this.pictureBox.Size = new System.Drawing.Size(223, 223);
            this.pictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox.TabIndex = 4;
            this.pictureBox.TabStop = false;
            // 
            // listBoxNarenciye
            // 
            this.listBoxNarenciye.FormattingEnabled = true;
            this.listBoxNarenciye.ItemHeight = 16;
            this.listBoxNarenciye.Location = new System.Drawing.Point(254, 90);
            this.listBoxNarenciye.Name = "listBoxNarenciye";
            this.listBoxNarenciye.Size = new System.Drawing.Size(391, 404);
            this.listBoxNarenciye.TabIndex = 2;
            // 
            // listBoxKati
            // 
            this.listBoxKati.FormattingEnabled = true;
            this.listBoxKati.ItemHeight = 16;
            this.listBoxKati.Location = new System.Drawing.Point(654, 90);
            this.listBoxKati.Name = "listBoxKati";
            this.listBoxKati.Size = new System.Drawing.Size(391, 404);
            this.listBoxKati.TabIndex = 4;
            // 
            // btnNarenciye
            // 
            this.btnNarenciye.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnNarenciye.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNarenciye.ForeColor = System.Drawing.Color.MediumBlue;
            this.btnNarenciye.Location = new System.Drawing.Point(254, 12);
            this.btnNarenciye.Name = "btnNarenciye";
            this.btnNarenciye.Size = new System.Drawing.Size(391, 75);
            this.btnNarenciye.TabIndex = 7;
            this.btnNarenciye.Text = "Narenciye Sıkacağı ";
            this.btnNarenciye.UseVisualStyleBackColor = false;
            this.btnNarenciye.Click += new System.EventHandler(this.btnNarenciye_Click);
            // 
            // btnKati
            // 
            this.btnKati.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnKati.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnKati.ForeColor = System.Drawing.Color.MediumBlue;
            this.btnKati.Location = new System.Drawing.Point(653, 12);
            this.btnKati.Name = "btnKati";
            this.btnKati.Size = new System.Drawing.Size(392, 75);
            this.btnKati.TabIndex = 6;
            this.btnKati.Text = "Katı Meyve Sıkacağı";
            this.btnKati.UseVisualStyleBackColor = false;
            this.btnKati.Click += new System.EventHandler(this.btnKati_Click);
            // 
            // lblToplamNarenciye
            // 
            this.lblToplamNarenciye.BackColor = System.Drawing.Color.White;
            this.lblToplamNarenciye.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblToplamNarenciye.ForeColor = System.Drawing.Color.Black;
            this.lblToplamNarenciye.Location = new System.Drawing.Point(254, 497);
            this.lblToplamNarenciye.Name = "lblToplamNarenciye";
            this.lblToplamNarenciye.Size = new System.Drawing.Size(391, 75);
            this.lblToplamNarenciye.TabIndex = 8;
            this.lblToplamNarenciye.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblToplamKati
            // 
            this.lblToplamKati.BackColor = System.Drawing.Color.White;
            this.lblToplamKati.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblToplamKati.ForeColor = System.Drawing.Color.Black;
            this.lblToplamKati.Location = new System.Drawing.Point(655, 497);
            this.lblToplamKati.Name = "lblToplamKati";
            this.lblToplamKati.Size = new System.Drawing.Size(390, 75);
            this.lblToplamKati.TabIndex = 9;
            this.lblToplamKati.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblToplamMeyve
            // 
            this.lblToplamMeyve.BackColor = System.Drawing.Color.White;
            this.lblToplamMeyve.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblToplamMeyve.ForeColor = System.Drawing.Color.Black;
            this.lblToplamMeyve.Location = new System.Drawing.Point(12, 497);
            this.lblToplamMeyve.Name = "lblToplamMeyve";
            this.lblToplamMeyve.Size = new System.Drawing.Size(223, 75);
            this.lblToplamMeyve.TabIndex = 10;
            this.lblToplamMeyve.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.MediumBlue;
            this.ClientSize = new System.Drawing.Size(1057, 584);
            this.Controls.Add(this.lblToplamMeyve);
            this.Controls.Add(this.lblToplamKati);
            this.Controls.Add(this.lblToplamNarenciye);
            this.Controls.Add(this.sureLabel);
            this.Controls.Add(this.sayacLabel);
            this.Controls.Add(this.btnKati);
            this.Controls.Add(this.btnNarenciye);
            this.Controls.Add(this.listBoxKati);
            this.Controls.Add(this.pictureBox);
            this.Controls.Add(this.listBoxNarenciye);
            this.Controls.Add(this.btnBasla);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Vitamin Deposu";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnBasla;
        private System.Windows.Forms.Label sureLabel;
        private System.Windows.Forms.Label sayacLabel;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.PictureBox pictureBox;
        private System.Windows.Forms.ListBox listBoxNarenciye;
        private System.Windows.Forms.ListBox listBoxKati;
        private System.Windows.Forms.Button btnNarenciye;
        private System.Windows.Forms.Button btnKati;
        private System.Windows.Forms.Label lblToplamNarenciye;
        private System.Windows.Forms.Label lblToplamKati;
        private System.Windows.Forms.Label lblToplamMeyve;
    }
}

