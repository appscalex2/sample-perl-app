#!/usr/bin/perl
use strict;
use warnings;
use HTTP::Server::Simple::CGI;

# Define a minimal HTTP server package
{
    package HelloServer;
    use base 'HTTP::Server::Simple::CGI';

    sub handle_request {
        my ($self, $cgi) = @_;

        # Define the root route
        if ($cgi->path_info() eq '/') {
            print "HTTP/1.1 200 OK\r\n";
            print $cgi->header('text/plain');
            print "Hello Perl\n";
        } else {
            print "HTTP/1.1 404 Not Found\r\n";
            print $cgi->header('text/plain');
            print "Not Found\n";
        }
    }
}

# Start the server on port 8080 (change if needed)
my $server = HelloServer->new(80);
$server->run();
