import datetime
import json
from unittest.mock import patch
from src.code.current_time import current_time

def test_current_time(capsys):
    fixed_datetime = datetime.datetime(2024, 6, 26, 12, 0, 0)
    
    with patch('datetime.datetime') as mock_datetime:
        mock_datetime.now.return_value = fixed_datetime
        current_time(None, None)  
        captured_output = capsys.readouterr().out.strip()
        expected_output = '{"currentTime": "2023-06-25 12:00:00"}'
        
        assert captured_output == expected_output
