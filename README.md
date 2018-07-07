# WIPS

This Windows Batch script will download all the dependencies, to get JUST the Impulse Tracker player (`openmpt123`), and then
download and play the link you give it.

For example:

    $ wips "https://drive.google.com/uc?id=0B0_dMnzHroF-ckZsR3gwRllTUkU" -k "Winter Tear"
    Downloading music from '"https://drive.google.com/uc?id=0B0_dMnzHroF-ckZsR3gwRllTUkU"'...

    Playing!

    openmpt123 v0.3.10, libopenmpt 0.3.10+r10491 (OpenMPT 1.27.08.02-r10491 https://source.openmpt.org/svn/openmpt/tags/libopenmpt-0.3.10@10491 (2018-06-17T05:52:27Z) clean)

    Copyright (c) 2013-2018 OpenMPT developers <https://lib.openmpt.org/>

    Filename...: temp.it
    Size.......: 453kB
    Type.......: it (Impulse Tracker)
    Tracker....: OpenMPT 1.26.05.00
    Date.......: 2017-06-03T11:26:38Z
    Artist.....: Gustavo6046
    Title......:
    Duration...: 02:33.948
    Subsongs...: 1
    Channels...: 8
    Orders.....: 13
    Patterns...: 10
    Instruments: 0
    Samples....: 5

             L : >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:          :
             R : >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:          :
    Settings...: Gain: 0 dB   Stereo: 100 %   Filter: 8 taps   Ramping: -1
    Mixer......: CPU::0.09%   Chn:::5
    Player.....: Ord:::0/:13 Pat:::0 Row:::2   Spd:10 Tmp:135
    Position...: 00:00.399 / 02:33.948

    ====

    Cleaning up downloaded files...
    Winter Tear.it already exists, overwrite? (y/n): y
    Done!
