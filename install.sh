# MIT License
#
# Copyright (c) 2021 Soohwan Kim and Sangchun Ha and Soyoung Cho
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117;
pip install librosa sentencepiece pytorch_lightning==1.6.5 hydra-core;

pip install -e .

conda install -c pytorch torchaudio
conda install -c conda-forge librosa

# Install warp-rnnt
# Refer to : https://github.com/1ytic/warp-rnnt
git clone https://github.com/1ytic/warp-rnnt
cd warp-rnnt/pytorch_binding
python setup.py install
cd ../..

# Install ctcdecode
# Refer to : https://github.com/parlance/ctcdecode
git clone --recursive https://github.com/parlance/ctcdecode.git
cd ctcdecode && pip install .
