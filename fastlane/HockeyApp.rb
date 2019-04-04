
desc "HockeyApp upload test."
lane :desney_hockey_test do
    disney_hockey(ipa:"../FastlaneBuilds/dev/20180529.1/SHDR.ipa",
                  dsym:"../FastlaneBuilds/dev/20180529.1/SHDR.app.dSYM.zip",
                  public_identifier:"1b139db648f3c608dd28afa84e445a12",
                  api_token:"c0633bbc6dd54106beef0389d742a3ea",
                  notify:"0",
                  notes:"1. [FP-8786] - SHDR FP|Link order| After link DRC order,it show all the ticket vid under this order  2. [FP-8804] - SHDR FP|Link Order|Current two day's SHDR order can't divide the order into individual tickets  3. [FP-8845] - SHDR FP |Link order|:It only show one of tickets under my tickets when link DRC order(1/2 day tickets,Not enter park)")
end
