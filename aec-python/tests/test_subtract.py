import unittest
from calc import aec_subtract

class TestSubtract(unittest.TestCase):
    def test_subtract(self):
        arg_ints = [20, 5]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 15)

if __name__=="__main__":
    unittest.main()