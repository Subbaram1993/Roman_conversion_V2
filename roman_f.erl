-module(roman_f). 

-export([convert_to_roman/1]).
-export([test_convert_roman/1]).

-define(BASIC_ROMAN_NUMERAL_MAP, #{
                               0 => "",
                               1 => "I",
                               2 => "II",
                               3 => "III",
                               4 => "IV",
                               5 => "V",
                               6 => "VI",
                               7 => "VII",
                               8 => "VIII",
                               9 => "IX",
                               10 => "X",
                               20 => "XX",
                               30 => "XXX",
                               40 => "XL",
                               50 => "L",
                               60 => "LX",
                               70 => "LXX",
                               80 => "LXXX",
                               90 => "XC",
                               100 => "C",
                               200 => "CC",
                               300 => "CCC",
                               400 => "CD",
                               500 => "D",
                               600 => "DC",
                               700 => "DCC",
                               800 => "DCCC",
                               900 => "CM",
                               1000 => "M",
                               2000 => "MM",
                               3000 => "MMM"
                                }). 

convert_to_roman(Int) when Int > 0, Int < 4000 ->
    ThousandDiv = Int div 1000,
    Thousands = ThousandDiv * 1000,
    case ThousandDiv of
        0 -> ThousandsStr = "";
        _ -> ThousandsStr = maps:get(Thousands, ?BASIC_ROMAN_NUMERAL_MAP, "Unmapped1000")
    end,

    ThousandRem = Int - Thousands, 
    HundredDiv = ThousandRem div 100,
    Hundreds = HundredDiv * 100,
    case HundredDiv of
        0 -> HundredsStr = "";
        _ -> HundredsStr = maps:get(Hundreds, ?BASIC_ROMAN_NUMERAL_MAP, "Unmapped100")
    end,

    HundredRem = Int - Thousands - Hundreds,
    TensDiv = HundredRem div 10,
    Tens = TensDiv * 10,
    case TensDiv of
        0 -> TensStr = "";
        _ -> TensStr = maps:get(Tens, ?BASIC_ROMAN_NUMERAL_MAP, "Unmapped10")
    end,

    TensRem = Int - Thousands - Hundreds - Tens,
    OnesStr =  maps:get(TensRem, ?BASIC_ROMAN_NUMERAL_MAP, "Unmapped1"),
    ThousandsStr ++ HundredsStr ++ TensStr ++ OnesStr.
test_convert_roman(List) ->
  Roman = convert_to_roman(List), 
  io:format("~s",[Roman]).
                 
