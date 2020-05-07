import datetime

def log(s):
    line = "[{}] {}".format(datetime.datetime.now(), s)
    print(line)

    with open("amonet.log", "a") as fout:
        fout.write(line + "\n")
