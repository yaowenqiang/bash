In the Perl script 'test.pl'
    ...
    my $WEBROOT = <WEBROOT_PATH>;
    ...
To force variable substitution try:
$export WEBROOT_PATH=/usr/local/webroot
$set 's/<WEBROOT_PATH>/$WEBROOT_PATH/'
But this just gives:
    my $WEBROOT = $WEBROOT_PATH

However:
    $export WEBROOT_PATH=/usr/local/webroot
    $eval sed 's%\<WEBROOT_PATH\>%WEBROOT_PATH' < test.pl
That works fine,and gives the expected substitution:
    my $WEBROOT = /usr/local/webroot;
# TODO 暂时还不会perl,没看懂
