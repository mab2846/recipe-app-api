from django.test import TestCase

from app.calc import add, subtract, algo


class CalcTests(TestCase):

    def test_add_numbers(self):
        """Test that two numbers are added together"""
        self.assertEqual(add(3, 8), 11)

    def test_subtract_numbers(self):
        """Test that values are subtracted and returned"""
        self.assertEqual(subtract(10, 5), 5)

    def test_algo_numbers(self):
        """Test that values are subtracted and returned"""
        self.assertEqual(algo(3, 2), 0)
