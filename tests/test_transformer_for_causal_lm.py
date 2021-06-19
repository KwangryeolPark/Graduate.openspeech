import unittest
import logging
import torch

from openspeech.criterion import Perplexity, PerplexityLossConfigs
from openspeech.lm.transformer_for_causal_lm import TransformerForCausalLM
from openspeech.utils import build_dummy_configs, DUMMY_LM_INPUTS, DUMMY_INPUT_LENGTHS, DUMMY_TARGETS
from openspeech.vocabs.ksponspeech.character import KsponSpeechCharacterVocabulary

logger = logging.getLogger(__name__)


class TestTransformerForCausalLM(unittest.TestCase):
    def test_forward(self):
        configs = build_dummy_configs(
            criterion_configs=PerplexityLossConfigs(),
        )
        vocab = KsponSpeechCharacterVocabulary(configs)

        model = TransformerForCausalLM(
            num_classes=4,
            max_length=32,
            d_model=64,
            num_heads=4,
            d_ff=128,
            pad_id=0,
            sos_id=1,
            eos_id=2,
            num_layers=3,
        )

        criterion = Perplexity(configs, vocab)
        optimizer = torch.optim.Adam(model.parameters(), lr=1e-04)

        for i in range(3):
            logits = model(DUMMY_LM_INPUTS, DUMMY_INPUT_LENGTHS)

            loss = criterion(logits, DUMMY_TARGETS)
            loss.backward()
            optimizer.step()
            assert type(loss.item()) == float

    def test_forward_step(self):
        configs = build_dummy_configs(
            criterion_configs=PerplexityLossConfigs(),
        )
        vocab = KsponSpeechCharacterVocabulary(configs)

        model = TransformerForCausalLM(
            num_classes=4,
            max_length=32,
            d_model=64,
            num_heads=4,
            d_ff=128,
            pad_id=0,
            sos_id=1,
            eos_id=2,
            num_layers=3,
        )

        criterion = Perplexity(configs, vocab)
        optimizer = torch.optim.Adam(model.parameters(), lr=1e-04)

        for i in range(1, 4):
            input_lengths = torch.IntTensor([i] * 3)
            logits = model.forward_step(DUMMY_LM_INPUTS[:i], input_lengths)
            loss = criterion(logits, DUMMY_TARGETS[:i])
            loss.backward()
            optimizer.step()
            assert type(loss.item()) == float


if __name__ == '__main__':
    unittest.main()
