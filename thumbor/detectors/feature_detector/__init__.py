#!/usr/bin/python
# -*- coding: utf-8 -*-

# thumbor imaging service
# https://github.com/thumbor/thumbor/wiki

# Licensed under the MIT license:
# http://www.opensource.org/licenses/mit-license
# Copyright (c) 2011 globo.com thumbor@googlegroups.com

import numpy as np

from thumbor.detectors import BaseDetector
from thumbor.point import FocalPoint
from thumbor.utils import logger


class Detector(BaseDetector):

    def detect(self, callback):
        self.next(callback)
