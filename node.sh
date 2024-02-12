#!/bin/bash

curl -fsSL https://get.docker.com | sh && git clone https://github.com/Gozargah/Marzban-node 
cat << EOF > /root/Marzban-node/docker-compose.yml
services:
  marzban-node:
    # build: .
    image: gozargah/marzban-node:latest
    restart: always
    network_mode: host

    environment:
      SERVICE_PORT: 62050
      XRAY_API_PORT: 62051
      SSL_CLIENT_CERT_FILE: "/var/lib/marzban-node/ssl_client_cert.pem"

    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
EOF

cat << EOF > /var/lib/marzban-node/ssl_client_cert.pem
-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjMxMTIxMjMzMzA0WhgPMjEyMzEwMjgyMzMzMDRaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAhwXG2jE2gXzu
jtz3Sgx90m5b9eoqPfSHkhjQOGnGxBoxHOCKzHabLUwLS3urf7HjO60lWaIIqYio
F/ovQvGv07dNgcYOXsbcSwxQEK7XSlYVnXQlfHW8D7zcJn5cs9Uiyzn9P/l81kp0
J5QrIb2mEeS4S1IaesckzBTs9jQt4/OxgrRKoFRKfbczEk5lT9iCo96a02YD0jPP
XwclGdb759bdZ7PnGW3x9ta9+Ojw50gzJCajXTd4wRFIcS4gujX6LQI54qyRH7yp
ZEyWpzKm5JKT+ip3MdpJjEeq9HUsOpIc72dY6LPBJgA9FytXAuMYR0STlHx4odIx
osZkLut2CaSp4N7nrka2jlDtABf7frDzUSHcEbGiAU6kupmZbBqEdF8zDyHQkGFy
jdnmkz66V9/cBbQA612sfUK9B/l14uJ0ve+WOhYQvj5cv8ELJXDANcj3olvC79sq
WA26zCAL6cYnkZ8L66s2hkxXxR95X3f7kUCFLba8S0e11/mijPGvbF16PweNy5Vv
eynCPOndLVBq1g6dd9MS5Xj8EsZQXz9THyWIMt0mcQGcyDYNsUl/sIpf94i5a6Il
s6A22W9Ca05Z+nXvvgeFn3e80EzZBZQrUGW6vV7e8UV0tAT+c8xV7u/+ter7NEY7
meIw+qiSXDjkB+4hnNx1GwzMGnm5Ix0CAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
Wl6z/qcwmVp+EUs8eKWLgfBh8O/3dpWyzv4HcgpW3id7D4/r7zYgNyafQhYB5Fbd
F1wCVbjweNTIs+CXASKSneUIkQnvuKrni6B+ljocUO88+ba2H3byLSJ+Rz1iIUAv
YWAjW56eSLDH+ToeWQQ5sSJPGC65Fb3NiDFf6tIMUXVzI5cbpFC8qdeXHQF1ISEH
IUpoKNopwEFI+4e7C5L2L8zNDkirbDh0aVICwRRjDSkd/mtwMuGCcm5fxuKnazZy
Y6XzETqVsYGPoVutxaFAMHujJYfLjLGdIt3UAVn1Yf7pVGHDF3fD3WFUHNJgG9zB
7ZO7BF4/mfho3z8NO/YZG3ixd/gUE75B55lbur8zcg0JTMoA5xHTqcpGAkq4EF+/
3RjPXh2nKfpwyuD+iAfb4sitFmfFwCyTHSUPYYmxzoKbdnyytxM3NyfJNmvvbD5g
ZPk7U0VREr0aVgGL+bvQ7aRpnasr/jAVc3ffTxJizW1G0Ip7o+XKJjZ89QFE+w/t
ZrZvq4Y83lB/IoMrNeaZXKduKK+H5++8yd6mH9u1O9H5U/KAVGPnRTI/B43kmzV4
17L0s4VICHNos4pR3Huue1NBSe9aJSrUPYSMR98Wk2swN5jT8o2WfhjbWJTO+77F
B2hvyh5G/yFhVtt+8bRjCovVaHzZefeUFcnEt5jSglA=
-----END CERTIFICATE-----
EOF

cd /root/Marzban-node  && docker compose up -d
