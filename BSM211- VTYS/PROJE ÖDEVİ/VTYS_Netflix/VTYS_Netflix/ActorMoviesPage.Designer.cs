namespace VTYS_Netflix
{
    partial class ActorMoviesPage
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
            this.label2 = new System.Windows.Forms.Label();
            this.dataActorMovies = new System.Windows.Forms.DataGridView();
            this.cmbOyuncu = new System.Windows.Forms.ComboBox();
            this.btnGoster = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataActorMovies)).BeginInit();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(12, 344);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(104, 25);
            this.label2.TabIndex = 108;
            this.label2.Text = "OYUNCU";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // dataActorMovies
            // 
            this.dataActorMovies.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataActorMovies.BackgroundColor = System.Drawing.Color.Red;
            this.dataActorMovies.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataActorMovies.Location = new System.Drawing.Point(12, 12);
            this.dataActorMovies.Name = "dataActorMovies";
            this.dataActorMovies.RowHeadersWidth = 51;
            this.dataActorMovies.RowTemplate.Height = 24;
            this.dataActorMovies.Size = new System.Drawing.Size(499, 250);
            this.dataActorMovies.TabIndex = 110;
            this.dataActorMovies.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataActorMovies_CellClick);
            // 
            // cmbOyuncu
            // 
            this.cmbOyuncu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.cmbOyuncu.FormattingEnabled = true;
            this.cmbOyuncu.Location = new System.Drawing.Point(17, 372);
            this.cmbOyuncu.Name = "cmbOyuncu";
            this.cmbOyuncu.Size = new System.Drawing.Size(230, 28);
            this.cmbOyuncu.TabIndex = 120;
            this.cmbOyuncu.SelectedIndexChanged += new System.EventHandler(this.cmbOyuncu_SelectedIndexChanged);
            // 
            // btnGoster
            // 
            this.btnGoster.BackColor = System.Drawing.Color.Black;
            this.btnGoster.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnGoster.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(254)));
            this.btnGoster.ForeColor = System.Drawing.Color.Red;
            this.btnGoster.Location = new System.Drawing.Point(386, 344);
            this.btnGoster.Name = "btnGoster";
            this.btnGoster.Size = new System.Drawing.Size(125, 62);
            this.btnGoster.TabIndex = 122;
            this.btnGoster.Text = "TÜMÜNÜ GÖSTER";
            this.btnGoster.UseVisualStyleBackColor = false;
            this.btnGoster.Click += new System.EventHandler(this.btnGoster_Click);
            // 
            // ActorMoviesPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Red;
            this.ClientSize = new System.Drawing.Size(523, 418);
            this.Controls.Add(this.btnGoster);
            this.Controls.Add(this.cmbOyuncu);
            this.Controls.Add(this.dataActorMovies);
            this.Controls.Add(this.label2);
            this.Name = "ActorMoviesPage";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ActorMoviesPage";
            this.Load += new System.EventHandler(this.ActorMoviesPage_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataActorMovies)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataActorMovies;
        private System.Windows.Forms.ComboBox cmbOyuncu;
        private System.Windows.Forms.Button btnGoster;
    }
}