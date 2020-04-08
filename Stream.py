#!/usr/bin/python

import sys

def main():

	try :
		for line in sys.stdin:
				line = line.strip().split(",")
				if(line[0]!="Dates" and line[1]!="Location" and line[2]!="ERS" and line[3]!="Type"):
					month = line[0].split("-")[1]
					print("%s,%s,%s,%s" % (month,line[1].lower(),line[2].lower(),line[3].lower()))
	except:
		return None
if __name__== "__main__":
	main()

