namespace VTYS_Netflix
{
    partial class SubPage
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
            this.dataSub = new System.Windows.Forms.DataGridView();
            this.txtAranacak = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.btnGoster = new System.Windows.Forms.Button();
            this.cmbPlanAra = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cmbSehirAra = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataSub)).BeginInit();
            this.SuspendLayout();
            // 
            // dataSub
            // 
            this.dataSub.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataSub.BackgroundColor = System.Drawing.Color.Red;
            this.dataSub.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataSub.Location = new System.Drawing.Point(12, 216);
            this.dataSub.Name = "dataSub";
            this.dataSub.RowHeadersWidth = 51;
            this.dataSub.RowTemplate.Height = 24;
            this.dataSub.Size = new System.Drawing.Size(993, 325);
            this.dataSub.TabIndex = 124;
            // 
            // txtAranacak
            // 
            this.txtAranacak.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.txtAranacak.Location = new System.Drawing.Point(12, 37);
            this.txtAranacak.Name = "txtAranacak";
            this.txtAranacak.Size = new System.Drawing.Size(219, 26);
            this.txtAranacak.TabIndex = 140;
            this.txtAranacak.TextChanged += new System.EventHandler(this.txtAranacak_TextChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label7.ForeColor = System.Drawing.Color.White;
            this.label7.Location = new System.Drawing.Point(12, 9);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(182, 25);
            this.label7.TabIndex = 141;
            this.label7.Text = "İSME GÖRE ARA";
            // 
            // btnGoster
            // 
            this.btnGoster.BackColor = System.Drawing.Color.Black;
            this.btnGoster.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnGoster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnGoster.ForeColor = System.Drawing.Color.Red;
            this.btnGoster.Location = new System.Drawing.Point(755, 153);
            this.btnGoster.Name = "btnGoster";
            this.btnGoster.Size = new System.Drawing.Size(250, 57);
            this.btnGoster.TabIndex = 142;
            this.btnGoster.Text = "TÜMÜNÜ GÖSTER";
            this.btnGoster.UseVisualStyleBackColor = false;
            this.btnGoster.Click += new System.EventHandler(this.btnGoster_Click);
            // 
            // cmbPlanAra
            // 
            this.cmbPlanAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbPlanAra.FormattingEnabled = true;
            this.cmbPlanAra.Location = new System.Drawing.Point(12, 96);
            this.cmbPlanAra.Name = "cmbPlanAra";
            this.cmbPlanAra.Size = new System.Drawing.Size(219, 28);
            this.cmbPlanAra.TabIndex = 144;
            this.cmbPlanAra.SelectedIndexChanged += new System.EventHandler(this.cmbPlanAra_SelectedIndexChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label9.ForeColor = System.Drawing.Color.White;
            this.label9.Location = new System.Drawing.Point(7, 66);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(200, 25);
            this.label9.TabIndex = 143;
            this.label9.Text = "PLANA GÖRE ARA";
            // 
            // cmbSehirAra
            // 
            this.cmbSehirAra.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbSehirAra.FormattingEnabled = true;
            this.cmbSehirAra.Location = new System.Drawing.Point(12, 153);
            this.cmbSehirAra.Name = "cmbSehirAra";
            this.cmbSehirAra.Size = new System.Drawing.Size(219, 28);
            this.cmbSehirAra.TabIndex = 147;
            this.cmbSehirAra.SelectedIndexChanged += new System.EventHandler(this.cmbSehirAra_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(7, 123);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(207, 25);
            this.label1.TabIndex = 146;
            this.label1.Text = "ŞEHİRE GÖRE ARA";
            // 
            // SubPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Red;
            this.ClientSize = new System.Drawing.Size(1017, 553);
            this.Controls.Add(this.cmbSehirAra);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbPlanAra);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.btnGoster);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtAranacak);
            this.Controls.Add(this.dataSub);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "SubPage";
            this.Text = "SubPage";
            this.Load += new System.EventHandler(this.SubPage_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataSub)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dataSub;
        private System.Windows.Forms.TextBox txtAranacak;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnGoster;
        private System.Windows.Forms.ComboBox cmbPlanAra;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cmbSehirAra;
        private System.Windows.Forms.Label label1;
    }
}