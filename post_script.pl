#! /usr/local/bin/perl

######################################################
# HTTP POST Perl
# This script will post JSON data to todoCreate
# which will create a todo item
######################################################

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request::Common;

my $ua = LWP::UserAgent->new;

#my $post_url = 'http://localhost:8080/todos';
my $post_url = 'http://quiet-woodland-5198.herokuapp.com/todos';

my $datestring = localtime();
my $post_data = '{"name":"New Todo '.$datestring.'"}';

my $req = HTTP::Request->new( 'POST', $post_url );
$req->header( 'Content-Type' => 'application/json' );
$req->content( $post_data );

my $response = $ua->request($req);

if ($response->is_success){
	$response->decoded_content;
	print "Response Code: ".$response->code."\n";
	print "Response Content:\n".$response->decoded_content."\n";
}
else{
	print "HTTP POST error code: ".$response->code."\n";
	print "HTTP POST error message: ".$response->message."\n";
}