defmodule Sentinel.Support.Factory do
  @moduledoc """
  Factories for pieces of the DealerRater.com reviews page.
  """
  def wrong_format_review do
    """
    <div class="review-entry col-xs-12 text-left pad-none pad-top-lg  border-bottom-teal-lt">
      <div class="col-xs-12 col-sm-3 pad-left-none text-center review-date margin-bottom-md">
        <div class="italic col-xs-6 col-sm-12 pad-none margin-none font-20">March 26, 2021</div>
        <div class="col-xs-6 col-sm-12 pad-none dealership-rating">
          <div class="rating-static hidden-xs rating-50 margin-center"></div>
          <div class="col-xs-12 hidden-xs pad-none margin-top-sm small-text dr-grey">SALES VISIT - NEW
          </div>
        </div>
      </div>

      <div class="col-xs-12 col-sm-9 pad-none review-wrapper">
        <!-- REVIEW TITLE, USER-->
        <div class="margin-bottom-sm line-height-150">
          <h3 class="no-format inline italic-bolder font-20 dark-grey">"Adrian)He was a great sales man
            he really helped my wife..."</h3>
          <span class="italic font-18 black notranslate">- rbginvestments2</span>
        </div>
      </div>
    </div>
    """
  end

  def review do
    """
    <div class="review-entry col-xs-12 text-left pad-none pad-top-lg  border-bottom-teal-lt">
    <a name="r8030282"></a>
    <div class="col-xs-12 col-sm-3 pad-left-none text-center review-date margin-bottom-md">
      <div class="italic col-xs-6 col-sm-12 pad-none margin-none font-20">March 26, 2021</div>
      <div class="col-xs-6 col-sm-12 pad-none dealership-rating">
        <div class="rating-static visible-xs pad-none margin-none rating-50 pull-right"></div>
        <div class="rating-static hidden-xs rating-50 margin-center"></div>
        <div class="col-xs-12 hidden-xs pad-none margin-top-sm small-text dr-grey">SALES VISIT - NEW
        </div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-9 pad-none review-wrapper">
      <!-- REVIEW TITLE, USER-->
      <div class="margin-bottom-sm line-height-150">
        <h3 class="no-format inline italic-bolder font-20 dark-grey">"Adrian)He was a great sales man
          he really helped my wife..."</h3>
        <span class="italic font-18 black notranslate">- rbginvestments2</span>
      </div>

      <!-- REVIEW BODY -->

      <div class="tr margin-top-md">
        <div class="td text-left valign-top ">
          <p class="font-16 review-content margin-bottom-none line-height-25">Adrian)He was a great
            sales man he really helped my wife &amp; i as we had just lost our car as it died on us
          </p>
          <a id="8030282"
            class="read-more-toggle pointer line-height-25 small-text block margin-bottom-md">Read
            More</a>
        </div>
      </div>

      <!-- REVIEW RATINGS - ALL -->
      <div
        class="pull-left pad-left-md pad-right-md bg-grey-lt margin-bottom-md review-ratings-all review-hide">
        <!-- REVIEW RATING - CUSTOMER SERVICE -->
        <div class="table width-100 pad-left-none pad-right-none margin-bottom-md">
          <div class="tr">
            <div class="lt-grey small-text td">Customer Service</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - QUALITY OF WORK -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Quality of Work</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - FRIENDLINESS -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Friendliness</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - PRICING -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Pricing</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - EXPERIENCE -->
          <div class="tr margin-bottom-md">
            <div class="td lt-grey small-text">Overall Experience</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - RECOMMEND DEALER -->
          <div class="tr">
            <div class="lt-grey small-text td">Recommend Dealer</div>
            <div class="td small-text boldest">
              Yes
            </div>
          </div>
        </div>


      </div>

      <!-- EMPLOYEE SECTION -->
      <div class="clear-fix  margin-top-sm">
        <div class="col-xs-12 lt-grey pad-left-none employees-wrapper">
          <div class="small-text">Employees Worked With </div>

          <div
            class="col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee">
            <div class="table">
              <div class="td square-image employee-image"
                style="background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/f00ae268a4b8.jpg)">
              </div>

              <div class="td valign-bottom pad-left-md pad-top-none pad-bottom-none">
                <a class="notranslate pull-left line-height-1 tagged-emp small-text teal  margin-right-sm emp-273456"
                  data-emp-id="273456" href="/sales/Adrian-AyyDee-Cortes-review-273456/">
                  Adrian "AyyDee" Cortes
                </a>
                <div class="col-xs-12 pad-none margin-none pad-top-sm">


                  <div class="relative employee-rating-badge-sm">
                    <div class="col-xs-12 pad-none">
                      <span
                        class="pull-left font-14 boldest lt-grey line-height-1 pad-right-sm margin-right-sm border-right">5.0</span>
                      <div class="rating-static rating-50 margin-top-none pull-left"></div>
                    </div>

                  </div>

                </div>
              </div>

            </div>

          </div>
          <div
            class="col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee">
            <div class="table">
              <div class="td square-image employee-image"
                style="background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/338f32ce6a76.jpg)">
              </div>

              <div class="td valign-bottom pad-left-md pad-top-none pad-bottom-none">
                <a class="notranslate pull-left line-height-1 tagged-emp small-text teal   emp-507107"
                  data-emp-id="507107" href="/sales/Brandon-McCloskey-review-507107/">
                  Brandon McCloskey
                </a>
                <div class="col-xs-12 pad-none margin-none pad-top-sm">


                  <div class="relative employee-rating-badge-sm">
                    <div class="col-xs-12 pad-none">
                      <span
                        class="pull-left font-14 boldest lt-grey line-height-1 pad-right-sm margin-right-sm border-right">5.0</span>
                      <div class="rating-static rating-50 margin-top-none pull-left"></div>
                    </div>

                  </div>

                </div>
              </div>

            </div>

          </div>
        </div>
      </div>

      <!-- SOCIAL MEDIA AND REVIEW ACTIONS -->
      <div class="col-xs-12 pad-none review-hide margin-top-lg">
        <div class="pull-left">
          <a href="https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/8030282&amp;via=dealerrater&amp;text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People"
            onclick="window.open('https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/8030282&amp;via=dealerrater&amp;text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"
            target="_blank" rel="nofollow" title="Twitter"><img class="align-bottom"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon_twitter_sm.png"
              height="20"></a>
          <a href="http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/8030282"
            onclick="window.open('http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/8030282', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"
            target="_blank" rel="nofollow" title="Facebook"><img class="align-bottom"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon_facebook_sm.png"
              height="20"></a>
        </div>
        <div class="pull-left margin-left-md">
          <a href="#" onclick="javascript:window.reportReview(8030282); return false;"
            class="small-text">Report</a> |
          <a href="#"
            onclick="window.open('/consumer/dealer/23685/review/8030282/print', 'report', 'toolbar=no,scrollbars=yes,location=no,width=720,height=400,resizable=yes'); return false;"
            class="small-text">Print</a>
        </div>
      </div>

      <!-- PUBLIC MESSAGES -->

      <!-- WAS HELPFUL SECTION -->
      <div class="col-xs-12 margin-bottom-lg">
        <div class="pull-right">
          <a href="#" class="helpful-button"
            onclick="javascript:MarkReviewHelpful(8030282, this); return false;">
            <img class="pull-left margin-right-sm"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon-thumbsup.png">
            Helpful <span class="helpful-count display-none" id="helpful_count_8030282">0</span></a>
        </div>
      </div>
    </div>

    </div>

    """
  end

  def wrong_date_review do
    """
    <div class="review-entry col-xs-12 text-left pad-none pad-top-lg  border-bottom-teal-lt">
    <a name="r8030282"></a>
    <div class="col-xs-12 col-sm-3 pad-left-none text-center review-date margin-bottom-md">
      <div class="italic col-xs-6 col-sm-12 pad-none margin-none font-20">2021, March 26</div>
      <div class="col-xs-6 col-sm-12 pad-none dealership-rating">
        <div class="rating-static visible-xs pad-none margin-none rating-50 pull-right"></div>
        <div class="rating-static hidden-xs rating-50 margin-center"></div>
        <div class="col-xs-12 hidden-xs pad-none margin-top-sm small-text dr-grey">SALES VISIT - NEW
        </div>
      </div>
    </div>
    <div class="col-xs-12 col-sm-9 pad-none review-wrapper">
      <!-- REVIEW TITLE, USER-->
      <div class="margin-bottom-sm line-height-150">
        <h3 class="no-format inline italic-bolder font-20 dark-grey">"Adrian)He was a great sales man
          he really helped my wife..."</h3>
        <span class="italic font-18 black notranslate">- rbginvestments2</span>
      </div>

      <!-- REVIEW BODY -->

      <div class="tr margin-top-md">
        <div class="td text-left valign-top ">
          <p class="font-16 review-content margin-bottom-none line-height-25">Adrian)He was a great
            sales man he really helped my wife &amp; i as we had just lost our car as it died on us
          </p>
          <a id="8030282"
            class="read-more-toggle pointer line-height-25 small-text block margin-bottom-md">Read
            More</a>
        </div>
      </div>

      <!-- REVIEW RATINGS - ALL -->
      <div
        class="pull-left pad-left-md pad-right-md bg-grey-lt margin-bottom-md review-ratings-all review-hide">
        <!-- REVIEW RATING - CUSTOMER SERVICE -->
        <div class="table width-100 pad-left-none pad-right-none margin-bottom-md">
          <div class="tr">
            <div class="lt-grey small-text td">Customer Service</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - QUALITY OF WORK -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Quality of Work</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - FRIENDLINESS -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Friendliness</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - PRICING -->
          <div class="tr margin-bottom-md">
            <div class="lt-grey small-text td">Pricing</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - EXPERIENCE -->
          <div class="tr margin-bottom-md">
            <div class="td lt-grey small-text">Overall Experience</div>
            <div class="rating-static-indv rating-50 margin-top-none td"></div>
          </div>

          <!-- REVIEW RATING - RECOMMEND DEALER -->
          <div class="tr">
            <div class="lt-grey small-text td">Recommend Dealer</div>
            <div class="td small-text boldest">
              Yes
            </div>
          </div>
        </div>


      </div>

      <!-- EMPLOYEE SECTION -->
      <div class="clear-fix  margin-top-sm">
        <div class="col-xs-12 lt-grey pad-left-none employees-wrapper">
          <div class="small-text">Employees Worked With </div>

          <div
            class="col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee">
            <div class="table">
              <div class="td square-image employee-image"
                style="background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/f00ae268a4b8.jpg)">
              </div>

              <div class="td valign-bottom pad-left-md pad-top-none pad-bottom-none">
                <a class="notranslate pull-left line-height-1 tagged-emp small-text teal  margin-right-sm emp-273456"
                  data-emp-id="273456" href="/sales/Adrian-AyyDee-Cortes-review-273456/">
                  Adrian "AyyDee" Cortes
                </a>
                <div class="col-xs-12 pad-none margin-none pad-top-sm">


                  <div class="relative employee-rating-badge-sm">
                    <div class="col-xs-12 pad-none">
                      <span
                        class="pull-left font-14 boldest lt-grey line-height-1 pad-right-sm margin-right-sm border-right">5.0</span>
                      <div class="rating-static rating-50 margin-top-none pull-left"></div>
                    </div>

                  </div>

                </div>
              </div>

            </div>

          </div>
          <div
            class="col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee">
            <div class="table">
              <div class="td square-image employee-image"
                style="background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/338f32ce6a76.jpg)">
              </div>

              <div class="td valign-bottom pad-left-md pad-top-none pad-bottom-none">
                <a class="notranslate pull-left line-height-1 tagged-emp small-text teal   emp-507107"
                  data-emp-id="507107" href="/sales/Brandon-McCloskey-review-507107/">
                  Brandon McCloskey
                </a>
                <div class="col-xs-12 pad-none margin-none pad-top-sm">


                  <div class="relative employee-rating-badge-sm">
                    <div class="col-xs-12 pad-none">
                      <span
                        class="pull-left font-14 boldest lt-grey line-height-1 pad-right-sm margin-right-sm border-right">5.0</span>
                      <div class="rating-static rating-50 margin-top-none pull-left"></div>
                    </div>

                  </div>

                </div>
              </div>

            </div>

          </div>
        </div>
      </div>

      <!-- SOCIAL MEDIA AND REVIEW ACTIONS -->
      <div class="col-xs-12 pad-none review-hide margin-top-lg">
        <div class="pull-left">
          <a href="https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/8030282&amp;via=dealerrater&amp;text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People"
            onclick="window.open('https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/8030282&amp;via=dealerrater&amp;text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"
            target="_blank" rel="nofollow" title="Twitter"><img class="align-bottom"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon_twitter_sm.png"
              height="20"></a>
          <a href="http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/8030282"
            onclick="window.open('http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/8030282', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"
            target="_blank" rel="nofollow" title="Facebook"><img class="align-bottom"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon_facebook_sm.png"
              height="20"></a>
        </div>
        <div class="pull-left margin-left-md">
          <a href="#" onclick="javascript:window.reportReview(8030282); return false;"
            class="small-text">Report</a> |
          <a href="#"
            onclick="window.open('/consumer/dealer/23685/review/8030282/print', 'report', 'toolbar=no,scrollbars=yes,location=no,width=720,height=400,resizable=yes'); return false;"
            class="small-text">Print</a>
        </div>
      </div>

      <!-- PUBLIC MESSAGES -->

      <!-- WAS HELPFUL SECTION -->
      <div class="col-xs-12 margin-bottom-lg">
        <div class="pull-right">
          <a href="#" class="helpful-button"
            onclick="javascript:MarkReviewHelpful(8030282, this); return false;">
            <img class="pull-left margin-right-sm"
              src="https://www.dealerrater.com/ncdn/s/188.20210317.1/Graphics/icons/icon-thumbsup.png">
            Helpful <span class="helpful-count display-none" id="helpful_count_8030282">0</span></a>
        </div>
      </div>
    </div>

    </div>

    """
  end
end
