import unittest
from calc import aec_division


class Test_Divide(unittest.TestCase):
    def test_divide_ordinary(self):
        enum = 1

        result1 = aec_division([enum, 2])
        self.assertEqual(result1, 0.5)

    def test_divide_zero_denom(self):
        enum = 1
        with self.assertRaises(Exception):
            aec_division([enum, 0])

    def test_divide_number_args(self):
        args = [1, 2, 3]
        with self.assertRaises(ValueError):
            aec_division(args)


if __name__ == "__main__":
    unittest.main()
