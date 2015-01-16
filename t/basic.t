use FindBin qw($Bin);
use lib "$Bin/lib";

use Test::Most;
use Catalyst::Test 'MyApp';

{
  ok my $res = request '/example1';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/plain';
}

{
  ok my $res = request '/example2';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/plain';
}

{
  ok my $res = request '/example3';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'application/json';
}

{
  ok my $res = request '/basic/css/a.css';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/css';
}

{
  ok my $res = request '/basic/static/a.css';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/css';
}

# /basic/*/aaa/link2/*/*
{
  ok my $res = request '/basic/111/aaa/link2/333/444.txt';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/plain';
}

{
  ok my $res = request '/chainbase2/111/aaa/222.txt/link4/333';
  is $res->code, 200;
  is $res->content, "example\n";
  is $res->content_length, 8;
  is $res->content_type, 'text/plain';
}

done_testing;
