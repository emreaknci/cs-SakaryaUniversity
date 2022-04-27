
namespace b201210101_Odev2_Soru2
{
    partial class Form1
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
            this.numericBoyut = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rdbTranspoze = new System.Windows.Forms.RadioButton();
            this.rdbIz = new System.Windows.Forms.RadioButton();
            this.rdbTers = new System.Windows.Forms.RadioButton();
            this.rdbOkuma = new System.Windows.Forms.RadioButton();
            this.rdbCarpma = new System.Windows.Forms.RadioButton();
            this.rdbToplama = new System.Windows.Forms.RadioButton();
            this.rdbYazdirma = new System.Windows.Forms.RadioButton();
            this.btnIslem = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.numericBoyut)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // numericBoyut
            // 
            this.numericBoyut.Location = new System.Drawing.Point(49, 60);
            this.numericBoyut.Maximum = new decimal(new int[] {
            5,
            0,
            0,
            0});
            this.numericBoyut.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericBoyut.Name = "numericBoyut";
            this.numericBoyut.Size = new System.Drawing.Size(120, 22);
            this.numericBoyut.TabIndex = 0;
            this.numericBoyut.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericBoyut.ValueChanged += new System.EventHandler(this.numericBoyut_ValueChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(27, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(164, 48);
            this.label1.TabIndex = 1;
            this.label1.Text = "Matris boyutunu \r\nseciniz(1-5)";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rdbTranspoze);
            this.groupBox1.Controls.Add(this.rdbIz);
            this.groupBox1.Controls.Add(this.rdbTers);
            this.groupBox1.Controls.Add(this.rdbOkuma);
            this.groupBox1.Controls.Add(this.rdbCarpma);
            this.groupBox1.Controls.Add(this.rdbToplama);
            this.groupBox1.Controls.Add(this.rdbYazdirma);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.groupBox1.Location = new System.Drawing.Point(9, 104);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(200, 222);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Islemler";
            // 
            // rdbTranspoze
            // 
            this.rdbTranspoze.AutoSize = true;
            this.rdbTranspoze.Location = new System.Drawing.Point(7, 187);
            this.rdbTranspoze.Name = "rdbTranspoze";
            this.rdbTranspoze.Size = new System.Drawing.Size(130, 28);
            this.rdbTranspoze.TabIndex = 6;
            this.rdbTranspoze.TabStop = true;
            this.rdbTranspoze.Text = "Transpoze";
            this.rdbTranspoze.UseVisualStyleBackColor = true;
            // 
            // rdbIz
            // 
            this.rdbIz.AutoSize = true;
            this.rdbIz.Location = new System.Drawing.Point(7, 159);
            this.rdbIz.Name = "rdbIz";
            this.rdbIz.Size = new System.Drawing.Size(109, 28);
            this.rdbIz.TabIndex = 5;
            this.rdbIz.TabStop = true;
            this.rdbIz.Text = "Iz bulma";
            this.rdbIz.UseVisualStyleBackColor = true;
            // 
            // rdbTers
            // 
            this.rdbTers.AutoSize = true;
            this.rdbTers.Location = new System.Drawing.Point(7, 132);
            this.rdbTers.Name = "rdbTers";
            this.rdbTers.Size = new System.Drawing.Size(126, 28);
            this.rdbTers.TabIndex = 4;
            this.rdbTers.TabStop = true;
            this.rdbTers.Text = "Ters Alma";
            this.rdbTers.UseVisualStyleBackColor = true;
            // 
            // rdbOkuma
            // 
            this.rdbOkuma.AutoSize = true;
            this.rdbOkuma.Location = new System.Drawing.Point(7, 104);
            this.rdbOkuma.Name = "rdbOkuma";
            this.rdbOkuma.Size = new System.Drawing.Size(97, 28);
            this.rdbOkuma.TabIndex = 3;
            this.rdbOkuma.TabStop = true;
            this.rdbOkuma.Text = "Okuma";
            this.rdbOkuma.UseVisualStyleBackColor = true;
            // 
            // rdbCarpma
            // 
            this.rdbCarpma.AutoSize = true;
            this.rdbCarpma.Location = new System.Drawing.Point(7, 77);
            this.rdbCarpma.Name = "rdbCarpma";
            this.rdbCarpma.Size = new System.Drawing.Size(103, 28);
            this.rdbCarpma.TabIndex = 2;
            this.rdbCarpma.TabStop = true;
            this.rdbCarpma.Text = "Carpma";
            this.rdbCarpma.UseVisualStyleBackColor = true;
            // 
            // rdbToplama
            // 
            this.rdbToplama.AutoSize = true;
            this.rdbToplama.Location = new System.Drawing.Point(7, 50);
            this.rdbToplama.Name = "rdbToplama";
            this.rdbToplama.Size = new System.Drawing.Size(112, 28);
            this.rdbToplama.TabIndex = 1;
            this.rdbToplama.TabStop = true;
            this.rdbToplama.Text = "Toplama";
            this.rdbToplama.UseVisualStyleBackColor = true;
            // 
            // rdbYazdirma
            // 
            this.rdbYazdirma.AutoSize = true;
            this.rdbYazdirma.Location = new System.Drawing.Point(7, 22);
            this.rdbYazdirma.Name = "rdbYazdirma";
            this.rdbYazdirma.Size = new System.Drawing.Size(117, 28);
            this.rdbYazdirma.TabIndex = 0;
            this.rdbYazdirma.TabStop = true;
            this.rdbYazdirma.Text = "Yazdirma";
            this.rdbYazdirma.UseVisualStyleBackColor = true;
            // 
            // btnIslem
            // 
            this.btnIslem.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnIslem.Location = new System.Drawing.Point(16, 332);
            this.btnIslem.Name = "btnIslem";
            this.btnIslem.Size = new System.Drawing.Size(160, 43);
            this.btnIslem.TabIndex = 3;
            this.btnIslem.Text = "ISLEM SEC";
            this.btnIslem.UseVisualStyleBackColor = true;
            this.btnIslem.Click += new System.EventHandler(this.btnIslem_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(323, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 25);
            this.label2.TabIndex = 4;
            this.label2.Text = "A";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label3.Location = new System.Drawing.Point(678, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(26, 25);
            this.label3.TabIndex = 5;
            this.label3.Text = "B";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label4.Location = new System.Drawing.Point(373, 329);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(90, 25);
            this.label4.TabIndex = 6;
            this.label4.Text = "SONUC";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(978, 691);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnIslem);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.numericBoyut);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.numericBoyut)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.NumericUpDown numericBoyut;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdbTranspoze;
        private System.Windows.Forms.RadioButton rdbIz;
        private System.Windows.Forms.RadioButton rdbTers;
        private System.Windows.Forms.RadioButton rdbOkuma;
        private System.Windows.Forms.RadioButton rdbCarpma;
        private System.Windows.Forms.RadioButton rdbToplama;
        private System.Windows.Forms.RadioButton rdbYazdirma;
        private System.Windows.Forms.Button btnIslem;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
    }
}

