using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Microlibrairie
{
    public partial class Microlibrairie : Form
    {
        string pass = "";
        string connectionString = @"Server=localhost;Database=bookdb;Uid=root;Pwd=;";
        int id;
        

        public Microlibrairie()
        {
            InitializeComponent();
        }

        private void Microlibrairie_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(connectionString))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("BookAddOrEdit", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_id",id);
                mySqlCmd.Parameters.AddWithValue("_nom", textBox1.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_auteur", textBox2.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_description", textBox3.Text.Trim());
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("C'est bien ajouté");
            }
        }
    }
}
