use strict;
use DBI;

my $dbh = DBI->connect(
    "dbi:SQLite:dbname=test.db",
    "",
    "",
    { RaiseError => 1 },
) or die $DBI::errstr;

$dbh->do("DROP TABLE IF EXISTS Characters");
$dbh->do("CREATE TABLE Characters(Id INT PRIMARY KEY, fName TEXT, lName TEXT, home TEXT)");
$dbh->do("INSERT INTO Characters VALUES(1,'Rose','Tyler','Earth')");
$dbh->do("INSERT INTO Characters VALUES(2,'Zoe','Heriot','Space Station W3')");
$dbh->do("INSERT INTO Characters VALUES(3,'Jo','Grant','Earth')");
$dbh->do("INSERT INTO Characters VALUES(4,'Leela',null,'Earth')");
$dbh->do("INSERT INTO Characters VALUES(5,'Romana',null,'Gallifrey')");
$dbh->do("INSERT INTO Characters VALUES(6,'Clara','Oswald','Earth')");
$dbh->do("INSERT INTO Characters VALUES(7,'Adric',null,'Alzarius')");
$dbh->do("INSERT INTO Characters VALUES(8,'Susan','foreman','Gallifrey')");


my $sth = $dbh->prepare( "SELECT * FROM Characters" );
$sth->execute();

my @row;
while (@row = $sth->fetchrow_array()) {
    print "@row\n";
}

$sth->finish();
$dbh->disconnect();
