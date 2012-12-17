# Automatically created by: scrapy deploy

from setuptools import setup, find_packages

setup(
    name         = 'nrc',
    version      = '1.0',
    packages     = find_packages(),
    entry_points = {'scrapy': ['settings = nrc.settings']},
)
