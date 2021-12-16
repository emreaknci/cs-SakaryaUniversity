using Npgsql;
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
    public partial class ActorMoviesPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        public void oyuncuFilmleri(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"ActorMovies\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataActorMovies.DataSource = ds.Tables[0];
            con.Close();
        }
        public void oyuncuGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select \"Id\",\"FirstName\" || ' ' || \"LastName\" as \"kisi\" from \"Actors\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbOyuncu.DisplayMember = "kisi";
            cmbOyuncu.ValueMember = "Id";
            cmbOyuncu.DataSource = dt;
            con.Close();
        }
        public ActorMoviesPage()
        {
            InitializeComponent();
        }

        private void ActorMoviesPage_Load(object sender, EventArgs e)
        {
            oyuncuFilmleri(connection);
            oyuncuGoster(connection);
        }

        private void dataActorMovies_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataActorMovies.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            int directorId = Convert.ToInt32(dataActorMovies.CurrentRow.Cells["Id"].Value);
            cmbOyuncu.SelectedValue = directorId;
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            oyuncuFilmleri(connection);
        }

        private void btnAra_Click(object sender, EventArgs e)
        {

        }

        private void cmbOyuncu_SelectedIndexChanged(object sender, EventArgs e)
        {
            sorgu = "select * from \"ActorMovies\" where \"Id\"=" + Convert.ToInt32(cmbOyuncu.SelectedValue);
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataActorMovies.DataSource = dt;
            dataActorMovies.Refresh();
            connection.Close();
        }
    }
}
