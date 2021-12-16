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
    public partial class UserPlanPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;

        public void planGetir(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Plans\"  where \"Id\">0 order by \"Id\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataPlan.DataSource = ds.Tables[0];
            con.Close();
        }
        public void oldPlanGetir(NpgsqlConnection con)
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            sorgu = "select * from \"public\".\"OldPlanPrices\" order by \"Id\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataOldPlan.DataSource = ds.Tables[0];
            con.Close();
        }
        public void oldPlanGetir(int id, NpgsqlConnection con)
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            sorgu = "select * from \"public\".\"OldPlanPrices\" where \"PlanId\"=" + id + " order by \"Id\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataOldPlan.DataSource = ds.Tables[0];
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
            txtFiyat.Clear();
            txtKalite.Clear();
        }
        public UserPlanPage()
        {
            InitializeComponent();
        }

        private void UserPlanPage_Load(object sender, EventArgs e)
        {
            planGetir(connection);
            oldPlanGetir(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Plans\" (\"Name\",\"Price\",\"VideoQuality\") values (@ad,@fiyat,@kalite)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@fiyat", Convert.ToInt32(txtFiyat.Text));
            komut.Parameters.AddWithValue("@kalite", txtKalite.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            planGetir(connection);
            temizle();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Plans\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            planGetir(connection);
            oldPlanGetir(connection);
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Plans\" set \"Name\"=@ad,\"Price\"=@fiyat,\"VideoQuality\"=@kalite where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@fiyat", Convert.ToInt32(txtFiyat.Text));
            komut.Parameters.AddWithValue("@kalite", txtKalite.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            planGetir(connection);
            oldPlanGetir(connection);
        }

        private void dataPlan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataPlan.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataPlan.CurrentRow.Cells["Name"].Value.ToString();
            txtFiyat.Text = dataPlan.CurrentRow.Cells["Price"].Value.ToString();
            txtKalite.Text = dataPlan.CurrentRow.Cells["VideoQuality"].Value.ToString();
            oldPlanGetir(secilenId, connection);
        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            oldPlanGetir(connection);
        }
    }
}
