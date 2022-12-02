import unittest
from calc import aec_division

class Test_Divide(unittest.TestCase):
    def test_divide(self):
        enum = 1

        result1 = aec_division([enum, 2])
        self.assertEqual(result1, 0.5)

        with self.assertRaises(Exception):
            print(aec_division([enum, 0]))
            aec_division([enum, 0])

if __name__=="__main__":
    unittest.main()