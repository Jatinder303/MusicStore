using System.Data.SqlClient;

namespace MusicStore
{
    class Database
    {
        //Create Connection, Command and an Adapter
        private SqlConnection Conn = new SqlConnection();
        private SqlCommand Cmd = new SqlCommand();
        private SqlDataAdapter da = new SqlDataAdapter();

        //Database Class Constructure to set the defaults

        public Database()
        {
            string ConnString = @"Data Source=DPKASTG-05\SQLEXPRESS;Initial Catalog=MusicStore;Integrated Security=True";
            Conn.ConnectionString = ConnString;
            Cmd.Connection = Conn;
        }
    }
}
