defmodule CorruptionChecksumTest do
  use ExUnit.Case
  alias AdventPuzzle.CorruptionChecksum.{Parser, Solver}

  setup _context do
    {:ok, [sample_data: "5 1 9 5
                         7 5 3
                         2 4 6 8",
           sample_evenly_divided: "5 9 2 8
                                   9 4 7 3
                                   3 8 6 5",
           complex_data: "1919	2959	82	507	3219	239	3494	1440	3107	259	3544	683	207	562	276	2963
                          587	878	229	2465	2575	1367	2017	154	152	157	2420	2480	138	2512	2605	876
                          744	6916	1853	1044	2831	4797	213	4874	187	6051	6086	7768	5571	6203	247	285
                          1210	1207	1130	116	1141	563	1056	155	227	1085	697	735	192	1236	1065	156
                          682	883	187	307	269	673	290	693	199	132	505	206	231	200	760	612
                          1520	95	1664	1256	685	1446	253	88	92	313	754	1402	734	716	342	107
                          146	1169	159	3045	163	3192	1543	312	161	3504	3346	3231	771	3430	3355	3537
                          177	2129	3507	3635	2588	3735	3130	980	324	266	1130	3753	175	229	517	3893
                          4532	164	191	5169	4960	3349	3784	3130	5348	5036	2110	151	5356	193	1380	3580
                          2544	3199	3284	3009	3400	953	3344	3513	102	1532	161	143	2172	2845	136	2092
                          194	5189	3610	4019	210	256	5178	4485	5815	5329	5457	248	5204	4863	5880	3754
                          3140	4431	4534	4782	3043	209	216	5209	174	161	3313	5046	1160	160	4036	111
                          2533	140	4383	1581	139	141	2151	2104	2753	4524	4712	866	3338	2189	116	4677
                          1240	45	254	1008	1186	306	633	1232	1457	808	248	1166	775	1418	1175	287
                          851	132	939	1563	539	1351	1147	117	1484	100	123	490	152	798	1476	543
                          1158	2832	697	113	121	397	1508	118	2181	2122	809	2917	134	2824	3154	2791"]}
  end

  test "parser test", context do
    assert [[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]] == Parser.parse(context[:sample_data])
  end

  test "sample data checksum calculated correctly", context do
    assert 18 == Solver.solve(context[:sample_data])
  end

  test "sample data checksum for evenly divided strategy", context do
    assert 9 == Solver.solve(context[:sample_evenly_divided], :evenly_divided)
  end

  test "full data flow test on complex data", context do
    assert 53978 == Solver.solve(context[:complex_data])
  end

  test "complex data for evenly devided checksum", context do
    assert 314.0 ==  Solver.solve(context[:complex_data], :evenly_divided)
  end

end
