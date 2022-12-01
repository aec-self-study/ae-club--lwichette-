import argparse

import argparse
parser = argparse.ArgumentParser(
                description = "CLI calculator"
)

subparser = parser.add_subparsers(
                help = "sub-command held",
                dest = "command" 
)


add = subparser.add_parser("add", help = "add integers")
add.add_argument('values', type=int, nargs='+')
sub = subparser.add_parser("subtract", help = "subtract integers")
sub.add_argument('values', type=int, nargs='+')
div = subparser.add_parser("divide", help = "divide first float by second")
div.add_argument('values', type=float, nargs=2)
mult = subparser.add_parser("multiplicate", help = "multiplicate floats")
mult.add_argument('values', type=float, nargs='*')

args = parser.parse_args()

if args.command == "add": 
        result = sum(args.values)
        print(f"The Sum is: {result}")
    
elif args.command == "subtract":
        result = args.values[0]-sum(args.values[1:])
        print(f"The subtraction results in: {result}")

elif args.command == "divide":
        try:
            result = args.values[0]/args.values[1]
            print(f"the division results in: {result}")
        except:
            print("the division cant be done")

elif args.command == "multiplicate":
            if len(args.values) != 0: 
                result =  1
                for n in args.values:
                    result = result * n
                print(f"the division results in: {result}")
            else:
                print(f"empty product leads to: 0")