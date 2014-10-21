use Encode::CN::Utility;
use Test::More tests => 24;

is(hz2gbk("a"), "61", "'a' ===> '61'");
is(hz2gbk("��"), "a1b0", "'��' ===> 'a1b0'");
is(hz2gbk("С"), "d0a1", "'С'��===> 'd0a1'");
is(hz2gbk("a��С"), "61a1b0d0a1", "'a��С' ===> '61a1b0d0a1'");

is(gbk2hz("62"), "b", "'62' ===> 'b'");
is(gbk2hz("a1b6"), "��", "'a1b6' ===> '��'");
is(gbk2hz("d0a3"), "У", "'d0a3' ===> 'У'");
is(gbk2hz("62a1b6d0a3"), "b��У", "'62a1b6d0a3' ===> 'b��У'");

is(hz2utf8("c"), "63", "'c' ===> '63'");
is(hz2utf8("��"), "e28098", "'��' ===> 'e28098'");
is(hz2utf8("Щ"), "e4ba9b", "'Щ' ===> 'e4ba9b'");
is(hz2utf8("c��Щ"), "63e28098e4ba9b", "'c��Щ' ===> '63e28098e4ba9b'");

is(hz2unicode("d"), "64", "'d' ===> '64'");
is(hz2unicode("��"), "f7", "'��' ===> 'f7'");
is(hz2unicode("д"), "5199", "'д' ==> '5199'");
is(hz2unicode("d��д"), "64f75199", "'d��д' ==> '64f75199'");

is(utf82hz("e6969cc39765"), "б��e", "'e6969cc39765' ===> 'б��e'");

is(unicode2hz("3011"), "��", "'3011' ===> '��'");

is(gbk2utf8("d0a1"), "e5b08f", "'d0a1' ===> 'e5b08f'");
is(gbk2unicode("d0a1"), "5c0f", "'d0a1' ===> '5c0f'");
is(utf82gbk("e5b08f"), "d0a1", "'e5b08f' ===> 'd0a1'");
is(utf82unicode("e5b08f"), '5c0f', "'e5b085' ===> '5c0f'");
is(unicode2gbk("5c0f"), 'd0a1', "'5c0f' ===> 'd0a1'");
is(unicode2utf8("5c0f"), "e5b08f", "'5c0f' ===> 'e5b08f'");