import argparse

import argparse


def aec_subtract(ints_to_sub):
    arg_1 = ints_to_sub[0]
    args_rest = ints_to_sub[1:]
    our_sub = arg_1 - sum(args_rest)
    return our_sub


def aec_division(args_to_divide):
    try:
        return args_to_divide[0]/args_to_divide[1]
    except:
         raise ValueError('the division cant be done')


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



if __name__=="__main__":
    args = parser.parse_args()

    if args.command == "add": 
        result = sum(args.values)
        print(f"The Sum is: {result}")
    
    elif args.command == "subtract":
        result = aec_subtract(args.values)
        print(f"The subtraction results in: {result}")

    elif args.command == "divide":
        result = aec_division(args.values)
        print(f"the division results in: {result}")
           

    elif args.command == "multiplicate":
            if len(args.values) != 0: 
                result =  1
                for n in args.values:
                    result = result * n
                print(f"the product results in: {result}")
            else:
                print(f"empty product leads to: 0")