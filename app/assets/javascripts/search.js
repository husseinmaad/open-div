// $( document ).ready(function() {
$( document ).on('turbolinks:load', function() {
  autoCompleteListener();
});

var autoCompleteListener = function(){

  var companies = {
    'VoiLaw': 'http://public.crunchbase.com/t_api_images/v1477650628/dma2pm1hbrkupdnuqpa1.png',
    'Reesorz.com': 'http://public.crunchbase.com/t_api_images/v1477963776/t9gktlnczmxfoigrzrk9.png',
    'Pionyr Immunotherapeutics': 'http://public.crunchbase.com/t_api_images/v1483601591/mcwqqvlyygzw5fdz8mdq.png',
    'Piper': 'http://public.crunchbase.com/t_api_images/v1485426419/sysiwiqw6s4nxb0bjypj.png',
    'Ironqloud': 'http://public.crunchbase.com/t_api_images/v1477550652/xefbdii03c0tivu1mxfu.png',
    'Sense Strategies': 'http://public.crunchbase.com/t_api_images/v1484002838/rl7mhjf9ntcjy4blvilc.png',
    'Green Bay Advisors': 'http://public.crunchbase.com/t_api_images/v1481509442/eerttcfgarsakcn9mpp0.png',
    'Cyantag': 'http://public.crunchbase.com/t_api_images/v1478084492/zjd6ik0qucfdfrgpjpia.png',
    'Songstream': 'http://public.crunchbase.com/t_api_images/v1483989242/rzg0me57rgq6g2eqh5zr.png',
    'Voxility': 'http://public.crunchbase.com/t_api_images/v1478767988/uw0yfxvixxtd82oh376t.jpg',
    'Filament Hospitality': 'http://public.crunchbase.com/t_api_images/v1478295499/kpmoz7ivjqsjmwrpywdz.png',
    'DiveIn': 'http://public.crunchbase.com/t_api_images/v1485459038/g6ugkczyhkxanyrsw3uk.png',
    'Astranis': 'http://public.crunchbase.com/t_api_images/v1485594342/qxgrm1kraacmbscajgjr.png',
    'DxRx Medical': 'http://public.crunchbase.com/t_api_images/v1485249651/nhpvjbmgfl1ucmwuarzi.png',
    'VQuick': 'http://public.crunchbase.com/t_api_images/v1485928296/nno2cej2mcatvwewta3t.png',
    'I-Impact': 'http://public.crunchbase.com/t_api_images/v1479547988/ujngxuwguwrs6t703ens.png',
    'UXBio': 'http://public.crunchbase.com/t_api_images/v1481866490/bnctzu13dk0boniguwxt.png',
    'LunchBadger, Inc.': 'http://public.crunchbase.com/t_api_images/v1479443040/zxpm8gndlfy6gkvouqts.png',
    'Rubuz': 'http://public.crunchbase.com/t_api_images/v1483423389/neihhoziaaxysmf7iqjj.png',
    'Chimera Bioengineering': 'http://public.crunchbase.com/t_api_images/v1480325741/lpq7uk4zk88dyibkybg8.png',
    'Fact0ry X': 'http://public.crunchbase.com/t_api_images/v1477544354/lewa0ked2p1lz5xfzgdq.png',
    'Narrow Blue': 'http://public.crunchbase.com/t_api_images/v1480525259/lqxbsqak7hs9wpxem4tv.png',
    'The Beans': 'http://public.crunchbase.com/t_api_images/v1483633683/xq4b7si6bdcr67zzubin.png',
    'NimbusMart': 'http://public.crunchbase.com/t_api_images/v1486454352/hlwjs3998hceopfvhjhf.jpg',
    'SPROKIT': 'http://public.crunchbase.com/t_api_images/v1478664383/vflmpnh5pqzzehnswfrz.png',
    'Linqto': 'http://public.crunchbase.com/t_api_images/v1488581692/ob6wboifrhzksz9ov5ys.png',
    'Bestlaw': 'http://public.crunchbase.com/t_api_images/v1477793970/fwlnkgxle277fip63rer.png',
    'Bluetree Legal Connect': 'http://public.crunchbase.com/t_api_images/v1477641108/ikilrzbyequksyaux5wl.png',
    'Catalog Technologies': 'http://public.crunchbase.com/t_api_images/v1483783824/cc7o2jqrb1vj0igl0qnl.png',
    'FLYE': 'http://public.crunchbase.com/t_api_images/v1486691606/gffyhbxpccapccxpvrqx.png',
    'Shobu': 'http://public.crunchbase.com/t_api_images/v1478570076/immrcexi8phnzlzku8te.jpg',
    'Credit Swarm': '',
    'Fuel': 'http://public.crunchbase.com/t_api_images/v1482489700/yylcgqlgbbfhsjpuvww5.png',
    'Marketfox': 'http://public.crunchbase.com/t_api_images/v1486021237/jstyx6cymns81p4qy0kr.png',
    'Gram Health': 'http://public.crunchbase.com/t_api_images/v1484117517/tyfzhcszxqf8hpnqwgmq.png',
    'Dot Labs': 'http://public.crunchbase.com/t_api_images/v1481109263/t3mmblbuqaldg3q1le4k.png',
    'Presence AI': 'http://public.crunchbase.com/t_api_images/v1484732781/hnsokoh3aifwmpldog1x.png',
    'Virta': 'http://public.crunchbase.com/t_api_images/v1484615627/ldqyqlkn90e7ktjucaxy.png',
    'uTapp LLC': 'http://public.crunchbase.com/t_api_images/v1485711217/xdji0loe67gou55tszuz.png',
    'Sonar Technologies': 'http://public.crunchbase.com/t_api_images/v1483683480/y3zc283fw5f0opx8jqoy.png',
    'Wheelhouse': 'http://public.crunchbase.com/t_api_images/v1481329468/gjwzeidebyackd0iqyjz.png',
    'Zenplace': 'http://public.crunchbase.com/t_api_images/v1484620402/iw6xa6yhmyusoeodotii.png',
    'GEA Enzymes': 'http://public.crunchbase.com/t_api_images/v1479212638/qgdlcsuplfprwuk9kxpt.png',
    'GameBots': 'http://public.crunchbase.com/t_api_images/v1485593379/zirwfivz7jc0guuvxqlb.png',
    'After I Go': 'http://public.crunchbase.com/t_api_images/v1477628093/czvpdfcygvm9bvv66f2e.png',
    'AptoZen': 'http://public.crunchbase.com/t_api_images/v1479771257/bu0pzgmbkcesd0usssdi.png',
    'Champify': 'http://public.crunchbase.com/t_api_images/v1478305881/v20smjzngtlreudazi3d.png',
    'Day Digital': 'http://public.crunchbase.com/t_api_images/v1485447615/lnczlf9fi5outwztdybf.jpg',
    'SpoG': 'http://public.crunchbase.com/t_api_images/v1478376012/vcbckvi4kps83wrb1gow.png',
    'FutureModel': '',
    'Workpuls': 'http://public.crunchbase.com/t_api_images/v1480239750/tfvqgq6xcwcnfn1e1qhp.png',
    'VenomYx': 'http://public.crunchbase.com/t_api_images/v1479216055/jxgc1hi2nxdehzuukaiv.png',
    'Wearable IoT World': 'http://public.crunchbase.com/t_api_images/v1483682778/xttsfzmeyblqzfvxcetp.png',
    'Sigma': 'http://public.crunchbase.com/t_api_images/v1484941307/pa1rqjcpwbydztbeoabr.png',
    'BetterUp': 'http://public.crunchbase.com/t_api_images/v1479355890/mebnxxr9q8oeatvqbdp1.png',
    'Shogun': 'http://public.crunchbase.com/t_api_images/v1478547179/um6vqduyorzhzvpecxf6.png',
    'Windfall Data': 'http://public.crunchbase.com/t_api_images/v1485754963/lb0dwayi95t4ke5vmmqb.png',
    'Targeto Inc': '',
    'Impossible Labs': 'http://public.crunchbase.com/t_api_images/v1483310598/jcqcsx5xdj6rcyauwsfq.png',
    'Exalt Groupe Inc': 'http://public.crunchbase.com/t_api_images/v1477531872/fjmy0ysfylusu2fzsxjs.png',
    'Pakia Software Services LLC': 'http://public.crunchbase.com/t_api_images/v1484306974/h28dfuekwyffovptjudh.jpg',
    'Lexiqual': 'http://public.crunchbase.com/t_api_images/v1477655452/anovqkypkuhduv2xfmju.png',
    'Turo': 'http://public.crunchbase.com/t_api_images/v1480626107/klj0atxdbdk3ermzcz3q.png',
    'ViaeX': 'http://public.crunchbase.com/t_api_images/v1479213159/qks6ml2amzfoybagf8lr.png',
    'OneClick Ship': '',
    'EoExchange': '',
    'SkipFlag': 'http://public.crunchbase.com/t_api_images/v1483599453/frd714tl3ziujwarpk5b.png',
    'DiskFaktory': 'http://public.crunchbase.com/t_api_images/v1480082444/vcirsocnxkizovkwvaop.png',
    'ClearAccessIP': 'http://public.crunchbase.com/t_api_images/v1477647739/zc1nnsorvp5suzhalzfq.png',
    'PRX.co': 'http://public.crunchbase.com/t_api_images/v1484871708/bswaanuai7mv3atued1e.png',
    'Polychain Capital': 'http://public.crunchbase.com/t_api_images/v1481514511/modpfx4kq96fmtrfmeaq.png',
    'Mayfield Software': '',
    'Scaled Biolabs': 'http://public.crunchbase.com/t_api_images/v1479273490/qczw9cli9sx0ms3hr9b0.png',
    'Alike': 'http://public.crunchbase.com/t_api_images/v1482215804/tgwcsmo0d6jldmdn1lju.png',
    'MDadmit': '',
    'Cargocentric': 'http://public.crunchbase.com/t_api_images/v1483487503/lkd3n7d9ygxbzochm6zv.png',
    'Nonna Box': 'http://public.crunchbase.com/t_api_images/v1482473483/arbdd80lnzjtd7ynp9kn.jpg',
    'Text To Ticket': 'http://public.crunchbase.com/t_api_images/v1486400140/w5wkdkmigocrwiugoopl.jpg',
    'Rested': 'http://public.crunchbase.com/t_api_images/v1485600282/uqxzk9zdgvsbimuemibg.png',
    'One Preschool': 'http://public.crunchbase.com/t_api_images/v1486004273/wukjqzlpegdxa7erxvan.png',
    'Argent Mill': 'http://public.crunchbase.com/t_api_images/v1481004494/x0zjhfqc1bqilm9vd55r.png',
    'Genium.io': 'http://public.crunchbase.com/t_api_images/v1482297022/nryqgijgp1bggsdm6b5h.png',
    'Awair': 'http://public.crunchbase.com/t_api_images/v1485570079/kzgnoj29nmmodplinezy.png',
    'If Only': 'http://public.crunchbase.com/t_api_images/v1481787691/m2qs0ukvex6ffxkn4v2c.png',
    'Join It': 'http://public.crunchbase.com/t_api_images/v1477237271/pckqis0z9pc0btlv2dlc.png',
    'Vinci': 'http://public.crunchbase.com/t_api_images/v1478608961/rxq29jkpzlaayv7eterk.png',
    'Leif Therapeutics': 'http://public.crunchbase.com/t_api_images/v1484115770/jegwcfjlcdre8ygnkhet.png',
    'Skycool Systems': 'http://public.crunchbase.com/t_api_images/v1478666883/cezovts9rungpci4trih.png',
    'Machine': 'http://public.crunchbase.com/t_api_images/v1481669536/q37apjh3lebffpdtfr91.png',
    'Perlara': '',
    'Core Wellness': 'http://public.crunchbase.com/t_api_images/v1486195484/z16937by5ogmzauruwdv.png',
    'Acrossio (Across Lab Inc.)': 'http://public.crunchbase.com/t_api_images/v1478716426/l4n7wubiluhjfvdlmkvz.png',
    'Zephyr Digital': 'http://public.crunchbase.com/t_api_images/v1478130830/clswbt2bs209zcfomu5x.jpg',
    'Thalman Health': 'http://public.crunchbase.com/t_api_images/v1477349596/ttug82jno4e8bpt02ns6.jpg',
    'TalkIQ': 'http://public.crunchbase.com/t_api_images/v1483596871/nn3wqfqkzezsp3dc4vpl.png',
    'IAGO': 'http://public.crunchbase.com/t_api_images/v1482043868/r51rwgnlt1dipqs8hjqb.png',
    'Hyperstandard': 'http://public.crunchbase.com/t_api_images/v1486136484/mbzflazfzbatlgusfgff.png',
    'Campfire': 'http://public.crunchbase.com/t_api_images/v1479967186/bp476ygkvowya9hgdbg3.png',
    'SpiritualVR, Inc.': 'http://public.crunchbase.com/t_api_images/v1479503788/d1uuctfmihtwptrslgpy.png'

  };

  // Event listener for form on homepage header
  $('.home-search-form input.autocomplete').autocomplete({
    data: companies,
    limit: 20,
  });
  // .keyup(function (e) {
  //       if(e.which === 13) { // on enter
  //           console.log($('input.autocomplete').val())
  //          $.ajax({
  //           type: "GET",
  //           url: "/search",
  //           success: (console.log("success"))
  //          })
  //          .done(function(r){
  //           console.log(r);
  //          })
  //       }
  //   });
  // end of event listener

  // Event listener for search form on search results page
  $('.search-results-page-form input.autocomplete').autocomplete({
    data: companies,
    limit: 20,
  });
  // .keyup(function (e) {
  //       event.preventDefault();
  //       var $query = $(this);
  //       if(e.which === 13) { // on enter
  //           console.log($query.val())
  //          $.ajax({
  //           type: "GET",
  //           url: "/search",
  //           success: (console.log("success"))
  //         }).done(function(r){
  //           $('.search-results').append(r);
  //           console.log(r);
  //          })
  //       }
  //   })
  // end of event listener
};
