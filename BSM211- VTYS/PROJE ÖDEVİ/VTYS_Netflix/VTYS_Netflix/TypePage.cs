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
    public partial class TypePage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;

        public void turGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Types\"";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataTur.DataSource = ds.Tables[0];
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
        }
        public TypePage()
        {
            InitializeComponent();
        }

        private void TypePage_Load(object sender, EventArgs e)
        {
            turGoster(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Types\" (\"Name\") values (@ad)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            turGoster(connection);
            temizle();
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Types\" set \"Name\"=@ad where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            turGoster(connection);
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Types\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            turGoster(connection);
        }

        private void dataTur_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataTur.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataTur.CurrentRow.Cells["Name"].Value.ToString();
        }
    }
}
