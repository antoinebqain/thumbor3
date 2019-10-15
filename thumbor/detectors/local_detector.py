#!/usr/bin/python
# -*- coding: utf-8 -*-

# thumbor imaging service
# https://github.com/thumbor/thumbor/wiki

# Licensed under the MIT license:
# http://www.opensource.org/licenses/mit-license
# Copyright (c) 2011 globo.com thumbor@googlegroups.com

from os.path import join, dirname, abspath, isabs

import numpy as np

from thumbor.point import FocalPoint
from thumbor.detectors import BaseDetector


class CascadeLoaderDetector(BaseDetector):

    def load_cascade_file(self, module_path, cascade_file_path):
        pass

    def get_min_size_for(self, size):
        pass

    def get_features(self):
        pass

    def detect(self, callback):
        self.next(callback)
