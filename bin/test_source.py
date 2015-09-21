import sys
from subprocess import check_output
import time

tv_id, expect_len = (50667, 611)
decode_url = "http://114.215.175.21:3553/decode_st.php?url=http://%s:3553/source_tvid_iphone.php?tvid%%3D%s"
rounds = 10

if len(sys.argv) < 2:
    print "host_file required!"
    sys.exit(1)

host_file = sys.argv[1]

#print "cmd:", cmd
with open(host_file, "r") as f:
    hosts = f.read().splitlines()

for i in range(0, rounds):
    print "round:", i
    for host in hosts:
        api = decode_url % (host, tv_id)
        out = check_output(['curl', api], stderr=open('/dev/null'))
        #print "api: %s, len: %s" % (api, len(out))
        if len(out) != expect_len:
            print "bad host: %s, len: %s" % (api, len(out))
        #print "len: %s, out: %s" % (len(out), out)
    time.sleep(3)
