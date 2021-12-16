using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Netflix
{
    public partial class HomePage : Form
    {
        public void btnDefault(Color bg,Color fc)
        {
            btnOyuncu.BackColor = bg;
            btnFilm.BackColor = bg;
            btnAbone.BackColor = bg;
            btnCalisan.BackColor = bg;
            btnDepartman.BackColor = bg;
            btnPlan.BackColor = bg;
            btnTur.BackColor = bg;
            btnYonetmen.BackColor = bg;

            btnOyuncu.ForeColor = fc;
            btnFilm.ForeColor = fc;
            btnAbone.ForeColor = fc;
            btnCalisan.ForeColor = fc;
            btnDepartman.ForeColor = fc;
            btnPlan.ForeColor = fc;
            btnTur.ForeColor = fc;
            btnYonetmen.ForeColor =fc;
        }
        public void FormGetir(Form form,Button btn)
        {
            btnDefault(Color.Black, Color.Red);
            btn.BackColor = Color.Red;
            btn.ForeColor = Color.Black;
            this.IsMdiContainer = true;
            form.MdiParent = this;
            form.FormBorderStyle = FormBorderStyle.None;
            mainPanel.Controls.Add(form);
            form.Show();
            if (mainPanel.Controls.Count > 2)
                for (int i = 1; i < mainPanel.Controls.Count; i++)
                    mainPanel.Controls.RemoveAt(1);
        }

        public HomePage()
        {
            InitializeComponent();
        }

        private void HomePage_Load(object sender, EventArgs e)
        {
            lblKapat.Visible=false;
            btnDefault(Color.Black,Color.Red);
        }

        private void btnCalisan_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new EmployeePage(),btnCalisan);
        }

        private void btnDepartman_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new DepartmentPage(),btnDepartman);
        }

        private void btnFilm_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new MoviePage(),btnFilm);
        }

        private void btnOyuncu_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new ActorPage(),btnOyuncu);
        }

        private void btnYonetmen_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new DirectorPage(),btnYonetmen);
        }

        private void btnPlan_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new UserPlanPage(),btnPlan);
        }

        private void btnAbone_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new SubPage(),btnAbone);
        }

        private void btnTur_Click(object sender, EventArgs e)
        {
            lblKapat.Visible = true;
            FormGetir(new TypePage(),btnTur);
        }

        private void lblKapat_Click(object sender, EventArgs e)
        {
            for (int i = 1; i < mainPanel.Controls.Count; i++)
                mainPanel.Controls.RemoveAt(1);
            lblKapat.Visible=false;
        }

        private void lblKapat_MouseHover(object sender, EventArgs e)
        {
            lblKapat.ForeColor = Color.Black;
        }

        private void lblKapat_MouseLeave(object sender, EventArgs e)
        {
            lblKapat.ForeColor = Color.White;
        }


    }
}
