// TODO: Prefer naming vaiables accordingly like this

// <b:section class='main-feed-section' id='main-section' showaddelement='yes'>
//   <b:widget id='Blog1' locked='true' title='Blog Posts' type='Blog' visible='true'>
//     <b:widget-settings>
//       <b:widget-setting name='showDateHeader'>false</b:widget-setting>
//       <b:widget-setting name='style.textcolor'>#ffffff</b:widget-setting>
//       <b:widget-setting name='showShareButtons'>false</b:widget-setting>
//       <b:widget-setting name='showCommentLink'>false</b:widget-setting>
//       <b:widget-setting name='style.urlcolor'>#ffffff</b:widget-setting>
//       <b:widget-setting name='showAuthor'>false</b:widget-setting>
//       <b:widget-setting name='style.linkcolor'>#ffffff</b:widget-setting>
//       <b:widget-setting name='style.unittype'>TextAndImage</b:widget-setting>
//       <b:widget-setting name='style.bgcolor'>#ffffff</b:widget-setting>
//       <b:widget-setting name='reactionsLabel'/>
//       <b:widget-setting name='showAuthorProfile'>false</b:widget-setting>
//       <b:widget-setting name='style.layout'>1x1</b:widget-setting>
//       <b:widget-setting name='showLabels'>false</b:widget-setting>
//       <b:widget-setting name='showLocation'>false</b:widget-setting>
//       <b:widget-setting name='showTimestamp'>false</b:widget-setting>
//       <b:widget-setting name='postsPerAd'>1</b:widget-setting>
//       <b:widget-setting name='showBacklinks'>false</b:widget-setting>
//       <b:widget-setting name='style.bordercolor'>#ffffff</b:widget-setting>
//       <b:widget-setting name='showInlineAds'>false</b:widget-setting>
//       <b:widget-setting name='showReactions'>false</b:widget-setting>
//     </b:widget-settings>
//     <b:includable id='main' var='this'>
//   <div class='blog-posts hfeed container'>
//     <b:loop index='i' values='data:posts' var='post'>
//       <b:include data='post' name='postCommentsAndAd'/>
//     </b:loop>
//   </div>
//   <b:include cond='data:view.isMultipleItems' name='postPagination'/>
//   <b:include name='feedLinks'/>
//   <b:if cond='data:blog.isGoogleEverywhereLinkTooltipEnabled'>
//     <b:include name='tooltipCss'/>
//   </b:if>
// </b:includable>
//     <b:includable id='aboutPostAuthor'>
//   <div class='author-name'>
//     <a class='g-profile' expr:href='data:post.author.profileUrl' rel='author' title='author profile'>
//       <span>
//         <data:post.author.name/>
//       </span>
//     </a>
//   </div>
//   <div>
//     <span class='author-desc'>
//       <data:post.author.aboutMe/>
//     </span>
//   </div>
// </b:includable>
//     <b:includable id='addComments'>
//   <a expr:href='data:post.commentsUrl' expr:onclick='data:post.commentsUrlOnclick'>
//     <b:message name='messages.postAComment'/>
//   </a>
// </b:includable>
//     <b:includable id='blogThisShare'>
//   <b:with value='&quot;window.open(this.href, \&quot;_blank\&quot;, \&quot;height=270,width=475\&quot;); return false;&quot;' var='onclick'>
//     <b:include name='platformShare'/>
//   </b:with>
// </b:includable>
//     <b:includable id='bylineByName' var='byline'>
//   <b:switch var='data:byline.name'>
//   <b:case value='share'/>
//     <b:include cond='data:post.shareUrl' name='postShareButtons'/>
//   <b:case value='comments'/>
//     <b:include cond='data:post.allowComments' name='postCommentsLink'/>
//   <b:case value='location'/>
//     <b:include cond='data:post.location' name='postLocation'/>
//   <b:case value='timestamp'/>
//     <b:include cond='not data:view.isPage' name='postTimestamp'/>
//   <b:case value='author'/>
//     <b:include name='postAuthor'/>
//   <b:case value='labels'/>
//     <b:include cond='data:post.labels' name='postLabels'/>
//   <b:case value='icons'/>
//     <b:include cond='data:post.emailPostUrl' name='emailPostIcon'/>
//   </b:switch>
// </b:includable>
//     <b:includable id='bylineRegion' var='regionItems'>
//   <b:loop values='data:regionItems' var='byline'>
//     <b:include data='byline' name='bylineByName'/>
//   </b:loop>
// </b:includable>
//     <b:includable id='commentAuthorAvatar'>
//   <div class='avatar-image-container'>
//     <img class='author-avatar' expr:src='data:comment.authorAvatarSrc' height='35' width='35'/>
//   </div>
// </b:includable>
//     <b:includable id='commentDeleteIcon' var='comment'>
//   <span expr:class='&quot;item-control &quot; + data:comment.adminClass'>
//     <b:if cond='data:showCmtPopup'>
//       <div class='goog-toggle-button'>
//         <div class='goog-inline-block comment-action-icon'/>
//       </div>
//     <b:else/>
//       <a class='comment-delete' expr:href='data:comment.deleteUrl' expr:title='data:messages.deleteComment'>
//         <img src='https://resources.blogblog.com/img/icon_delete13.gif'/>
//       </a>
//     </b:if>
//   </span>
// </b:includable>
//     <b:includable id='commentForm' var='post'>
//   <div class='comment-form'>
//     <a name='comment-form'/>
//     <h4 id='comment-post-message'><data:messages.postAComment/></h4>
//     <b:if cond='data:this.messages.blogComment != &quot;&quot;'>
//       <p><data:this.messages.blogComment/></p>
//     </b:if>
//     <b:include data='post' name='commentFormIframeSrc'/>
//     <iframe allowtransparency='allowtransparency' class='blogger-iframe-colorize blogger-comment-from-post' expr:height='data:cmtIframeInitialHeight ?: &quot;90px&quot;' frameborder='0' id='comment-editor' name='comment-editor' src='' width='100%'/>
//     <data:post.cmtfpIframe/>
//     <script type='text/javascript'>
//       BLOG_CMT_createIframe(&#39;<data:post.appRpcRelayPath/>&#39;);
//     </script>
//   </div>
// </b:includable>
//     <b:includable id='commentFormIframeSrc' var='post'>
//   <a expr:href='data:post.commentFormIframeSrc' id='comment-editor-src'/>
// </b:includable>
//     <b:includable id='commentItem' var='comment'>
//   <div class='comment' expr:id='&quot;c&quot; + data:comment.id'>
//     <b:include cond='data:blog.enabledCommentProfileImages' name='commentAuthorAvatar'/>

//     <div class='comment-block'>
//       <div class='comment-author'>
//         <b:if cond='data:comment.authorUrl'>
//           <b:message name='messages.authorSaidWithLink'>
//             <b:param expr:value='data:comment.author' name='authorName'/>
//             <b:param expr:value='data:comment.authorUrl' name='authorUrl'/>
//           </b:message>
//         <b:else/>
//           <b:message name='messages.authorSaid'>
//             <b:param expr:value='data:comment.author' name='authorName'/>
//           </b:message>
//         </b:if>
//       </div>
//       <div expr:class='&quot;comment-body&quot; + (data:comment.isDeleted ? &quot; deleted&quot; : &quot;&quot;)'>
//         <data:comment.body/>
//       </div>
//       <div class='comment-footer'>
//         <span class='comment-timestamp'>
//           <a expr:href='data:comment.url' title='comment permalink'>
//             <data:comment.timestamp/>
//           </a>
//           <b:include data='comment' name='commentDeleteIcon'/>
//         </span>
//       </div>
//     </div>
//   </div>
// </b:includable>
//     <b:includable id='commentList' var='comments'>
//   <div id='comments-block'>
//     <b:loop values='data:comments' var='comment'>
//       <b:include data='comment' name='commentItem'/>
//     </b:loop>
//   </div>
// </b:includable>
//     <b:includable id='commentPicker' var='post'>
//   <b:if cond='data:post.showThreadedComments'>
//     <b:include data='post' name='threadedComments'/>
//   <b:else/>
//     <b:include data='post' name='comments'/>
//   </b:if>
// </b:includable>
//     <b:includable id='comments' var='post'>
//   <section expr:class='&quot;comments&quot; + (data:post.embedCommentForm ? &quot; embed&quot; : &quot;&quot;)' expr:data-num-comments='data:post.numberOfComments' id='comments'>
//     <a name='comments'/>
//     <b:if cond='data:post.allowComments'>

//       <b:include name='commentsTitle'/>

//       <div expr:id='data:widget.instanceId + &quot;_comments-block-wrapper&quot;'>
//         <b:include cond='data:post.comments' data='post.comments' name='commentList'/>
//       </div>

//       <b:if cond='data:post.commentPagingRequired'>
//         <div class='paging-control-container'>
//           <b:if cond='data:post.hasOlderLinks'>
//             <a expr:class='data:post.oldLinkClass' expr:href='data:post.oldestLinkUrl'>
//               <data:messages.oldest/>
//             </a>
//             <a expr:class='data:post.oldLinkClass' expr:href='data:post.olderLinkUrl'>
//               <data:messages.older/>
//             </a>
//           </b:if>

//           <span class='comment-range-text'>
//             <data:post.commentRangeText/>
//           </span>

//           <b:if cond='data:post.hasNewerLinks'>
//             <a expr:class='data:post.newLinkClass' expr:href='data:post.newerLinkUrl'>
//               <data:messages.newer/>
//             </a>
//             <a expr:class='data:post.newLinkClass' expr:href='data:post.newestLinkUrl'>
//               <data:messages.newest/>
//             </a>
//           </b:if>
//         </div>
//       </b:if>

//       <div class='footer'>
//         <b:if cond='data:post.embedCommentForm'>
//           <b:if cond='data:post.allowNewComments'>
//             <b:include data='post' name='commentForm'/>
//           <b:else/>
//             <data:post.noNewCommentsText/>
//           </b:if>
//         <b:else/>
//           <b:if cond='data:post.allowComments'>
//             <b:include data='post' name='addComments'/>
//           </b:if>
//         </b:if>
//       </div>
//     </b:if>
//     <b:if cond='data:showCmtPopup'>
//       <div id='comment-popup'>
//         <iframe allowtransparency='allowtransparency' frameborder='0' id='comment-actions' name='comment-actions' scrolling='no'>
//         </iframe>
//       </div>
//     </b:if>
//   </section>
// </b:includable>
//     <b:includable id='commentsLink'>
//   <a class='comment-link' expr:href='data:post.commentsUrl' expr:onclick='data:post.commentsUrlOnclick'>
//     <b:if cond='data:post.numberOfComments &gt; 0'>
//       <b:message name='messages.numberOfComments'>
//         <b:param expr:value='data:post.numberOfComments' name='numComments'/>
//       </b:message>
//     <b:else/>
//       <data:messages.postAComment/>
//     </b:if>
//   </a>
// </b:includable>
//     <b:includable id='commentsLinkIframe'>
//   <!-- G+ comments, no longer available. The includable is retained for backwards-compatibility. -->
// </b:includable>
//     <b:includable id='commentsTitle'>
//   <h3 class='title'><data:messages.comments/></h3>
// </b:includable>
//     <b:includable id='defaultAdUnit'>
//   <ins class='adsbygoogle' data-ad-format='auto' expr:data-ad-client='data:adClientId ?: data:blog.adsenseClientId' expr:data-ad-host='data:blog.adsenseHostId' expr:style='data:style ?: &quot;display: block;&quot;'>
//     <b:attr cond='not data:blog.analytics4' expr:value='data:blog.analyticsAccountNumber' name='data-analytics-uacct'/>
//   </ins>
//   <script>
//    (adsbygoogle = window.adsbygoogle || []).push({});
//   </script>
// </b:includable>
//     <b:includable id='emailPostIcon'>
//   <span class='byline post-icons'>
//     <!-- email post links -->
//     <span class='item-action'>
//       <a expr:href='data:post.emailPostUrl' expr:title='data:messages.emailPost'>
//         <b:include data='{ iconClass: &quot;touch-icon sharing-icon&quot; }' name='emailIcon'/>
//       </a>
//     </span>
//   </span>
// </b:includable>
//     <b:includable id='facebookShare'>
//   <b:with value='&quot;window.open(this.href, \&quot;_blank\&quot;, \&quot;height=430,width=640\&quot;); return false;&quot;' var='onclick'>
//     <b:include name='platformShare'/>
//   </b:with>
// </b:includable>
//     <b:includable id='feedLinks'>
//   <b:if cond='!data:view.isPost'> <!-- Blog feed links -->
//     <b:if cond='data:feedLinks'>
//       <div class='blog-feeds'>
//         <b:include data='feedLinks' name='feedLinksBody'/>
//       </div>
//     </b:if>
//   <b:else/> <!--Post feed links -->
//     <div class='post-feeds'>
//       <b:loop values='data:posts' var='post'>
//         <b:if cond='data:post.allowComments and data:post.feedLinks'>
//           <b:include data='post.feedLinks' name='feedLinksBody'/>
//         </b:if>
//       </b:loop>
//     </div>
//   </b:if>
// </b:includable>
//     <b:includable id='feedLinksBody' var='links'>
//   <div class='feed-links'>
//   <data:messages.subscribeTo/>
//   <b:loop values='data:links' var='f'>
//      <a class='feed-link' expr:href='data:f.url' expr:type='data:f.mimeType' target='_blank'><data:f.name/> (<data:f.feedType/>)</a>
//   </b:loop>
//   </div>
// </b:includable>
//     <b:includable id='footerBylines'>
//   <b:if cond='data:widgets.Blog.first.footerBylines'>
//     <b:loop index='i' values='data:widgets.Blog.first.footerBylines' var='region'>
//       <b:if cond='not data:region.items.empty'>
//         <div expr:class='&quot;post-footer-line post-footer-line-&quot; + (data:i + 1)'>
//           <b:with value='&quot;footer-&quot; + (data:i + 1)' var='regionName'>
//             <b:include data='region.items' name='bylineRegion'/>
//           </b:with>
//         </div>
//       </b:if>
//     </b:loop>
//   </b:if>
// </b:includable>
//     <b:includable id='googlePlusShare'>
// </b:includable>
//     <b:includable id='headerByline'>
//   <b:if cond='data:widgets.Blog.first.headerByline'>
//     <div class='post-header'>
//       <div class='post-header-line-1'>
//         <b:with value='&quot;header-1&quot;' var='regionName'>
//           <b:include data='data:widgets.Blog.first.headerByline.items' name='bylineRegion'/>
//         </b:with>
//       </div>
//     </div>
//   </b:if>
// </b:includable>
//     <b:includable id='homePageLink'>
//   <a class='home-link' expr:href='data:blog.homepageUrl'>
//     <data:messages.home/>
//   </a>
// </b:includable>
//     <b:includable id='iframeComments' var='post'>
//   <!-- G+ comments, no longer available. The includable is retained for backwards-compatibility. -->
// </b:includable>
//     <b:includable id='inlineAd' var='post'>
//   <b:if cond='!data:view.isPreview'>
//     <b:if cond='data:this.adCode or data:this.adClientId or data:blog.adsenseClientId'>
//       <!-- Ad -->
//       <div class='inline-ad'>
//         <b:if cond='data:this.adCode != &quot;&quot;'>
//           <data:this.adCode/>
//         <b:else/>
//           <b:include cond='data:this.adClientId or data:blog.adsenseClientId' name='defaultAdUnit'/>
//         </b:if>
//       </div>
//     </b:if>
//   <b:else/>
//     <div class='inline-ad'>
//       <div class='inline-ad-placeholder'>
//         <span><b:message name='messages.adsGoHere'/></span>
//       </div>
//     </div>
//   </b:if>
// </b:includable>
//     <b:includable id='linkShare'>
//   <b:with value='&quot;window.prompt(\&quot;Copy to clipboard: Ctrl+C, Enter\&quot;, \&quot;&quot; + data:originalUrl + &quot;\&quot;); return false;&quot;' var='onclick'>
//     <b:include name='platformShare'/>
//   </b:with>
// </b:includable>
//     <b:includable id='nextPageLink'>
//   <a class='blog-pager-older-link' expr:href='data:olderPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-older-link&quot;' expr:title='data:messages.olderPosts'>
//     <data:messages.olderPosts/>
//   </a>
// </b:includable>
//     <b:includable id='otherSharingButton'>
//   <span class='sharing-platform-button sharing-element-other' expr:aria-label='data:messages.shareToOtherApps.escaped' expr:data-url='data:originalUrl' expr:title='data:messages.shareToOtherApps.escaped' role='menuitem' tabindex='-1'>
//     <b:with value='{key: &quot;sharingOther&quot;}' var='platform'>
//       <b:include name='sharingPlatformIcon'/>
//     </b:with>
//     <span class='platform-sharing-text'><data:messages.shareOtherApps.escaped/></span>
//   </span>
// </b:includable>
//     <b:includable id='platformShare'>
//   <a expr:class='&quot;goog-inline-block sharing-&quot; + data:platform.key' expr:data-url='data:originalUrl' expr:href='data:shareUrl + &quot;&amp;target=&quot; + data:platform.target' expr:onclick='data:onclick ? data:onclick : &quot;&quot;' expr:title='data:platform.shareMessage' target='_blank'>
//     <span class='share-button-link-text'>
//       <data:platform.shareMessage/>
//     </span>
//   </a>
// </b:includable>
//     <b:includable id='post' var='post'>
//   <div class='post'>
//     <b:include data='post' name='postMeta'/>
//     <b:include data='post' name='postTitle'/>
//     <b:include name='headerByline'/>
//     <b:if cond='data:view.isSingleItem'>
//       <b:include data='post' name='postBody'/>
//     <b:else/>
//       <b:include data='post' name='postBodySnippet'/>
//       <b:include data='post' name='postJumpLink'/>
//     </b:if>
//     <b:include data='post' name='postFooter'/>
//   </div>
// </b:includable>
//     <b:includable id='postAuthor'>
//   <span class='byline post-author vcard'>
//     <span class='post-author-label'>
//       <data:byline.label/>
//     </span>
//     <span class='fn'>
//       <b:if cond='data:post.author.profileUrl'>
//         <meta expr:content='data:post.author.profileUrl'/>
//         <a class='g-profile' expr:href='data:post.author.profileUrl' rel='author' title='author profile'>
//           <span><data:post.author.name/></span>
//         </a>
//       <b:else/>
//         <span><data:post.author.name/></span>
//       </b:if>
//     </span>
//   </span>
// </b:includable>
//     <b:includable id='postBody' var='post'>
//   <!-- If metaDescription is empty, use the post body as the schema.org description too, for G+/FB snippeting. -->
//   <div class='post-body entry-content float-container' expr:id='&quot;post-body-&quot; + data:post.id'>
//     <data:post.body/>
//   </div>
// </b:includable>
//     <b:includable id='postBodySnippet' var='post'>
//   <b:include data='post' name='postBody'/>
// </b:includable>
//     <b:includable id='postCommentsAndAd' var='post'>
//   <article class='post-outer-container'>
//     <!-- Post title and body -->
//     <div class='post-outer'>
//       <b:include data='post' name='post'/>
//     </div>

//     <!-- Comments -->
//     <b:include cond='data:view.isSingleItem' data='post' name='commentPicker'/>

//     <!-- Show ad inside post container, after comments, if single item. -->
//     <b:include cond='data:view.isSingleItem and data:post.includeAd' data='post' name='inlineAd'/>
//   </article>

//   <!-- Show ad outside post container (between posts) for feed pages. -->
//   <b:include cond='data:view.isMultipleItems and data:post.includeAd' data='post' name='inlineAd'/>
// </b:includable>
//     <b:includable id='postCommentsLink'>
//   <b:if cond='data:view.isMultipleItems'>
//     <span class='byline post-comment-link container'>
//       <b:include cond='data:post.commentSource != 1' name='commentsLink'/>
//     </span>
//   </b:if>
// </b:includable>
//     <b:includable id='postFooter' var='post'>
//   <div class='post-footer'>
//     <b:include name='footerBylines'/>
//     <b:include data='post' name='postFooterAuthorProfile'/>
//   </div>
// </b:includable>
//     <b:includable id='postFooterAuthorProfile' var='post'>
//   <b:if cond='data:post.author.aboutMe and data:view.isPost'>
//     <div class='author-profile'>
//       <b:if cond='data:post.author.authorPhoto.url'>
//         <img class='author-image' expr:src='data:post.author.authorPhoto.url' width='50px'/>
//         <div class='author-about'>
//           <b:include data='post' name='aboutPostAuthor'/>
//         </div>
//       <b:else/>
//         <b:include data='post' name='aboutPostAuthor'/>
//       </b:if>
//     </div>
//   </b:if>
// </b:includable>
//     <b:includable id='postHeader' var='post'>
//   <b:include name='headerByline'/>
// </b:includable>
//     <b:includable id='postJumpLink' var='post'>
//   <div class='jump-link flat-button'>
//     <a expr:href='data:post.url fragment &quot;more&quot;' expr:title='data:post.title'>
//       <b:eval expr='data:blog.jumpLinkMessage'/>
//     </a>
//   </div>
// </b:includable>
//     <b:includable id='postLabels'>
//   <span class='byline post-labels'>
//     <span class='byline-label'><data:byline.label/></span>
//     <b:loop index='i' values='data:post.labels' var='label'>
//       <a expr:href='data:label.url' rel='tag'>
//         <data:label.name/>
//       </a>
//     </b:loop>
//   </span>
// </b:includable>
//     <b:includable id='postLocation'>
//   <span class='byline post-location'>
//     <data:byline.label/>
//     <a expr:href='data:post.location.mapsUrl' target='_blank'><data:post.location.name/></a>
//   </span>
// </b:includable>
//     <b:includable id='postMeta' var='post'>
//   <b:include data='post' name='postMetadataJSON'/>
// </b:includable>
//     <b:includable id='postMetadataJSONImage'>
//   &quot;image&quot;: {
//     &quot;@type&quot;: &quot;ImageObject&quot;,
//     <b:if cond='data:post.featuredImage.isResizable'>
//     &quot;url&quot;: &quot;<b:eval expr='resizeImage(data:post.featuredImage, 1200, &quot;1200:630&quot;)'/>&quot;,
//     &quot;height&quot;: 630,
//     &quot;width&quot;: 1200
//     <b:else/>
//     &quot;url&quot;: &quot;https://blogger.googleusercontent.com/img/b/U2hvZWJveA/AVvXsEgfMvYAhAbdHksiBA24JKmb2Tav6K0GviwztID3Cq4VpV96HaJfy0viIu8z1SSw_G9n5FQHZWSRao61M3e58ImahqBtr7LiOUS6m_w59IvDYwjmMcbq3fKW4JSbacqkbxTo8B90dWp0Cese92xfLMPe_tg11g/w1200/&quot;,
//     &quot;height&quot;: 348,
//     &quot;width&quot;: 1200
//     </b:if>
//   },
// </b:includable>
//     <b:includable id='postMetadataJSONPublisher'>
//  &quot;publisher&quot;: {
//     &quot;@type&quot;: &quot;Organization&quot;,
//     &quot;name&quot;: &quot;Blogger&quot;,
//     &quot;logo&quot;: {
//       &quot;@type&quot;: &quot;ImageObject&quot;,
//       &quot;url&quot;: &quot;https://blogger.googleusercontent.com/img/b/U2hvZWJveA/AVvXsEgfMvYAhAbdHksiBA24JKmb2Tav6K0GviwztID3Cq4VpV96HaJfy0viIu8z1SSw_G9n5FQHZWSRao61M3e58ImahqBtr7LiOUS6m_w59IvDYwjmMcbq3fKW4JSbacqkbxTo8B90dWp0Cese92xfLMPe_tg11g/h60/&quot;,
//       &quot;width&quot;: 206,
//       &quot;height&quot;: 60
//     }
//   },
// </b:includable>
//     <b:includable id='postPagination'>
//   <div class='blog-pager container' id='blog-pager'>
//     <b:include cond='data:newerPageUrl' name='previousPageLink'/>
//     <b:include cond='data:olderPageUrl' name='nextPageLink'/>
//     <b:include cond='data:view.url != data:blog.homepageUrl' name='homePageLink'/>
//   </div>
// </b:includable>
//     <b:includable id='postReactions'>
//   <!-- Reaction feature no longer available. The includable is retained for backwards-compatibility. -->
// </b:includable>
//     <b:includable id='postShareButtons'>
//   <div class='byline post-share-buttons goog-inline-block'>
//     <b:with value='data:sharingId ?: ((data:widget.instanceId ?: &quot;sharing&quot;) + &quot;-&quot; + (data:regionName ?: &quot;byline&quot;) + &quot;-&quot; + data:post.id)' var='sharingId'>
//       <!-- Note: 'sharingButtons' includable is from the default Sharing widget markup. -->
//       <b:include data='{                                                sharingId: data:sharingId,                                                originalUrl: data:post.url,                                                platforms: data:this.sharing.platforms,                                                shareUrl: data:post.shareUrl,                                                shareTitle: data:post.title,                                              }' name='sharingButtons'/>
//     </b:with>
//   </div>
// </b:includable>
//     <b:includable id='postTimestamp'>
//   <span class='byline post-timestamp'>
//     <data:byline.label/>
//     <b:if cond='data:post.url'>
//       <meta expr:content='data:post.url.canonical'/>
//       <a class='timestamp-link' expr:href='data:post.url' rel='bookmark' title='permanent link'>
//         <time class='published' expr:datetime='data:post.date.iso8601' expr:title='data:post.date.iso8601'>
//           <data:post.date/>
//         </time>
//       </a>
//     </b:if>
//   </span>
// </b:includable>
//     <b:includable id='postTitle' var='post'>
//   <a expr:name='data:post.id'/>
//   <b:if cond='data:post.title != &quot;&quot;'>
//     <h3 class='post-title entry-title'>
//       <b:if cond='data:post.link or (data:post.url and data:view.url != data:post.url)'>
//         <a expr:href='data:post.link ?: data:post.url'><data:post.title/></a>
//       <b:else/>
//         <data:post.title/>
//       </b:if>
//     </h3>
//   </b:if>
// </b:includable>
//     <b:includable id='previousPageLink'>
//   <a class='blog-pager-newer-link' expr:href='data:newerPageUrl' expr:id='data:widget.instanceId + &quot;_blog-pager-newer-link&quot;' expr:title='data:messages.newerPosts'>
//     <data:messages.newerPosts/>
//   </a>
// </b:includable>
//     <b:includable id='sharingButton'>
//   <span expr:aria-label='data:platform.shareMessage' expr:class='&quot;sharing-platform-button sharing-element-&quot; + data:platform.key' expr:data-href='data:shareUrl + &quot;&amp;target=&quot; + data:platform.target' expr:data-url='data:originalUrl' expr:title='data:platform.shareMessage' role='menuitem' tabindex='-1'>
//     <b:include name='sharingPlatformIcon'/>
//     <span class='platform-sharing-text'><data:platform.name/></span>
//   </span>
// </b:includable>
//     <b:includable id='sharingButtonContent'>
//   <div class='flat-icon-button ripple'>
//     <b:include name='shareIcon'/>
//   </div>
// </b:includable>
//     <b:includable id='sharingButtons'>
//   <div class='sharing' expr:aria-owns='&quot;sharing-popup-&quot; + data:sharingId' expr:data-title='data:shareTitle'>
//     <button class='sharing-button touch-icon-button' expr:aria-controls='&quot;sharing-popup-&quot; + data:sharingId' expr:aria-label='data:messages.share.escaped' expr:id='&quot;sharing-button-&quot; + data:sharingId' role='button'>
//       <b:include name='sharingButtonContent'/>
//     </button>
//     <b:include name='sharingButtonsMenu'/>
//   </div>
// </b:includable>
//     <b:includable id='sharingButtonsMenu'>
//   <div class='share-buttons-container'>
//     <ul aria-hidden='true' class='share-buttons hidden' expr:aria-label='data:messages.share.escaped' expr:id='&quot;sharing-popup-&quot; + data:sharingId' role='menu'>
//       <b:loop values='(data:platforms ?: data:blog.sharing.platforms) filter (p =&gt; p.key not in {&quot;blogThis&quot;})' var='platform'>
//         <li>
//           <b:include name='sharingButton'/>
//         </li>
//       </b:loop>
//       <li aria-hidden='true' class='hidden'>
//         <b:include name='otherSharingButton'/>
//       </li>
//     </ul>
//   </div>
// </b:includable>
//     <b:includable id='sharingPlatformIcon'>
//   <b:include data='{ iconClass: (&quot;touch-icon sharing-&quot; + data:platform.key) }' expr:name='data:platform.key + &quot;Icon&quot;'/>
// </b:includable>
//     <b:includable id='threadedCommentForm' var='post'>
//   <div class='comment-form'>
//     <a name='comment-form'/>
//     <h4 id='comment-post-message'><data:messages.postAComment/></h4>
//     <b:if cond='data:this.messages.blogComment != &quot;&quot;'>
//       <p><data:this.messages.blogComment/></p>
//     </b:if>
//     <b:include data='post' name='commentFormIframeSrc'/>
//     <iframe allowtransparency='allowtransparency' class='blogger-iframe-colorize blogger-comment-from-post' expr:height='data:cmtIframeInitialHeight ?: &quot;90px&quot;' frameborder='0' id='comment-editor' name='comment-editor' src='' width='100%'/>
//     <data:post.cmtfpIframe/>
//     <script type='text/javascript'>
//       BLOG_CMT_createIframe(&#39;<data:post.appRpcRelayPath/>&#39;);
//     </script>
//   </div>
// </b:includable>
//     <b:includable id='threadedCommentJs' var='post'>
//   <script async='async' expr:src='data:post.commentSrc' type='text/javascript'/>
//   <b:template-script inline='true' name='threaded_comments'/>
//   <script type='text/javascript'>
//     blogger.widgets.blog.initThreadedComments(
//         <data:post.commentJso/>,
//         <data:post.commentMsgs/>,
//         <data:post.commentConfig/>);
//   </script>
// </b:includable>
//     <b:includable id='threadedComments' var='post'>
//   <section class='comments threaded' expr:data-embed='data:post.embedCommentForm' expr:data-num-comments='data:post.numberOfComments' id='comments'>
//     <a name='comments'/>

//     <b:include name='commentsTitle'/>

//     <div class='comments-content'>
//       <b:if cond='data:post.embedCommentForm'>
//         <b:include data='post' name='threadedCommentJs'/>
//       </b:if>
//       <div id='comment-holder'>
//          <data:post.commentHtml/>
//       </div>
//     </div>

//     <p class='comment-footer'>
//       <b:if cond='data:post.allowNewComments'>
//         <b:include data='post' name='threadedCommentForm'/>
//       <b:else/>
//         <data:post.noNewCommentsText/>
//       </b:if>
//       <b:if cond='data:post.showManageComments'>
//         <b:include data='post' name='manageComments'/>
//       </b:if>
//     </p>

//     <b:if cond='data:showCmtPopup'>
//       <div id='comment-popup'>
//         <iframe allowtransparency='allowtransparency' frameborder='0' id='comment-actions' name='comment-actions' scrolling='no'>
//         </iframe>
//       </div>
//     </b:if>
//   </section>
// </b:includable>
//     <b:includable id='tooltipCss'>
//   <!-- LINT.IfChange -->
//   <style>
//     .post-body a.b-tooltip-container {
//       position: relative;
//       display: inline-block;
//     }

//     .post-body a.b-tooltip-container .b-tooltip {
//       display: block !important;
//       position: absolute;
//       top: 100%;
//       left: 50%;
//       transform: translate(-20%, 1px);
//       visibility: hidden;
//       opacity: 0;
//       z-index: 1;
//       transition: opacity 0.2s ease-in-out;
//     }

//     .post-body a.b-tooltip-container .b-tooltip iframe {
//       width: 200px;
//       height: 198px;
//       max-width: none;
//       border: none;
//       border-radius: 20px;
//       box-shadow: 1px 1px 3px 1px rgba(0, 0, 0, 0.2);
//     }

//     @media (hover: hover) {
//       .post-body a.b-tooltip-container:hover .b-tooltip {
//         visibility: visible;
//         opacity: 1;
//       }
//     }
//   </style>
//   <!-- LINT.ThenChange(//depot/google3/java/com/google/blogger/b2/layouts/widgets/v2-style.css) -->
// </b:includable>
//   </b:widget>
// </b:section>

import 'package:blogger_theme/blogger_theme.dart';

final blog_posts_widget = BWidget(
  id: 'Blog1',
  type: 'Blog',
  locked: true,
  title: 'Blog Posts',
  version: 2,
  isVisible: true,
  children: [
    //     BWidgetSettings(
    //       children: [
    //         BWidgetSetting(name: 'showDateHeader', children: [Text('false')]),
    //         BWidgetSetting(name: 'style.textcolor', children: [Text('#ffffff')]),
    //         BWidgetSetting(name: 'showShareButtons', children: [Text('false')]),
    //         BWidgetSetting(name: 'showCommentLink', children: [Text('true')]),
    //         BWidgetSetting(name: 'style.urlcolor', children: [Text('#ffffff')]),
    //         BWidgetSetting(name: 'showAuthor', children: [Text('true')]),
    //         BWidgetSetting(name: 'style.linkcolor', children: [Text('#ffffff')]),
    //         BWidgetSetting(name: 'style.unittype', children: [Text('TextAndImage')]),
    //         BWidgetSetting(name: 'style.bgcolor', children: [Text('#ffffff')]),
    //         BWidgetSetting(name: 'reactionsLabel', children: []),
    //         BWidgetSetting(name: 'showAuthorProfile', children: [Text('false')]),
    //         BWidgetSetting(name: 'style.layout', children: [Text('1x1')]),
    //         BWidgetSetting(name: 'showLabels', children: [Text('true')]),
    //         BWidgetSetting(name: 'showLocation', children: [Text('true')]),
    //         BWidgetSetting(name: 'showTimestamp', children: [Text('true')]),
    //         BWidgetSetting(name: 'postsPerAd', children: [Text('1')]),
    //         BWidgetSetting(name: 'showBacklinks', children: [Text('false')]),
    //         BWidgetSetting(name: 'style.bordercolor', children: [Text('#ffffff')]),
    //         BWidgetSetting(name: 'showInlineAds', children: [Text('false')]),
    //         BWidgetSetting(name: 'showReactions', children: [Text('false')]),
    //       ],
    //     ),

    //     BIncludable(
    //       id: 'postCard',
    //       varName: 'post',
    //       children: [
    //         A(
    //           attributes: {
    //             'class': 'card',
    //             'expr:href': 'data:post.url',
    //             'expr:id': '"card-" + data:post.id',
    //           },
    //           children: [
    //             Img(
    //               attributes: {
    //                 'class': 'card-img',
    //                 'expr:data-src': 'data:post.featuredImage ?: "https://via.placeholder.com/400x300?text=Antinna"',
    //                 'loading': 'lazy',
    //                 'src': 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7',
    //               },
    //             ),
    //             Div(
    //               attributes: {'class': 'card-body'},
    //               children: [
    //                 Div(
    //                   attributes: {'class': 'card-badge'},
    //                   children: [Text('Loading...')],
    //                 ),
    //                 H3(
    //                   attributes: {'class': 'card-title'},
    //                   children: [BData(value: 'post.title')],
    //                 ),
    //                 Div(
    //                   attributes: {'class': 'card-price'},
    //                   children: [Text('--')],
    //                 ),
    //               ],
    //             ),
    //             XmlComment('Raw JSON-LD for Grid Parser'),
    //             Div(
    //               attributes: {'class': 'hidden grid-data'},
    //               children: [BData(value: 'post.body')],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),

    //     BIncludable(
    //       id: 'main',
    //       varName: 'top',
    //       children: [
    //         BIf(
    //           cond: 'data:view.isHomepage',
    //           children: [
    //             BIf(
    //               cond: 'data:posts and data:posts any (p => p.labels and p.labels any (l => l.name == "featured" or l.name == "popular"))',
    //               children: [
    //                 H2(
    //                   attributes: {'class': 'section-title'},
    //                   children: [Text('Featured Selection')],
    //                 ),
    //                 Div(
    //                   attributes: {'class': 'grid', 'id': 'featured-grid'},
    //                   children: [
    //                     BLoop(
    //                       values: 'data:posts',
    //                       varName: 'post',
    //                       children: [
    //                         BIf(
    //                           cond: 'data:post.labels and data:post.labels any (l => l.name == "featured" or l.name == "popular")',
    //                           children: [
    //                             BInclude(name: 'postCard', data: 'post'),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             H2(
    //               attributes: {'class': 'section-title'},
    //               children: [Text('Latest Arrivals')],
    //             ),
    //           ],
    //         ),

    //         BIf(
    //           cond: 'data:view.isMultipleItems',
    //           children: [
    //             Div(
    //               attributes: {'class': 'grid', 'id': 'app-grid'},
    //               children: [
    //                 BLoop(
    //                   values: 'data:posts',
    //                   varName: 'post',
    //                   children: [
    //                     BInclude(name: 'postCard', data: 'post'),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             XmlComment('Pagination'),
    //             Div(
    //               attributes: {
    //                 'class': 'blog-pager',
    //                 'style': 'text-align:center; margin-top:40px;'
    //               },
    //               children: [
    //                 BIf(
    //                   cond: 'data:newerPageUrl',
    //                   children: [
    //                     A(
    //                       attributes: {
    //                         'class': 'v-btn',
    //                         'expr:href': 'data:newerPageUrl',
    //                         'style': 'text-decoration:none;'
    //                       },
    //                       children: [RawText('&#171; Newer')],
    //                     ),
    //                   ],
    //                 ),
    //                 BIf(
    //                   cond: 'data:olderPageUrl',
    //                   children: [
    //                     A(
    //                       attributes: {
    //                         'class': 'v-btn',
    //                         'expr:href': 'data:olderPageUrl',
    //                         'style': 'text-decoration:none; margin-left:10px;'
    //                       },
    //                       children: [RawText('Older &#187;')],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         BElse(),
    //         BLoop(
    //           values: 'data:posts',
    //           varName: 'post',
    //           children: [
    //             Div(
    //               attributes: {'id': 'app-item'},
    //               children: [
    //                 Div(
    //                   attributes: {
    //                     'class': 'breadcrumb',
    //                     'style': 'margin-bottom:20px; font-size:0.9rem;'
    //                   },
    //                   children: [
    //                     A(
    //                       attributes: {'expr:href': 'data:blog.homepageUrl'},
    //                       children: [Text('Home')],
    //                     ),
    //                     Text(' / '),
    //                     BIf(
    //                       cond: 'data:post.labels',
    //                       children: [
    //                         BLoop(
    //                           values: 'data:post.labels',
    //                           varName: 'label',
    //                           index: 'i',
    //                           children: [
    //                             A(
    //                               attributes: {'expr:href': 'data:label.url'},
    //                               children: [BData(value: 'label.name')],
    //                             ),
    //                             BIf(
    //                               cond: 'data:i < data:post.labels.size - 1',
    //                               children: [Text(', ')],
    //                             ),
    //                           ],
    //                         ),
    //                         Text(' / '),
    //                       ],
    //                     ),
    //                     BData(value: 'post.title'),
    //                   ],
    //                 ),

    //                 Div(
    //                   attributes: {
    //                     'class': 'product-layout',
    //                     'id': 'main-renderer',
    //                     'style': 'min-height: 400px;'
    //                   },
    //                   children: [
    //                     XmlComment('Initializing State'),
    //                     Div(
    //                       attributes: {
    //                         'id': 'initializing-state',
    //                         'style': 'padding:40px; text-align:center; grid-column: 1 / -1;'
    //                       },
    //                       children: [
    //                         Div(
    //                           attributes: {
    //                             'class': 'v-btn',
    //                             'style': 'display:inline-block; cursor:default; animation: pulse 1.5s infinite;'
    //                           },
    //                           children: [Text('Initializing Data Engine...')],
    //                         ),
    //                       ],
    //                     ),

    //                     Div(
    //                       attributes: {
    //                         'class': 'carousel-container hidden',
    //                         'id': 'carousel-section'
    //                       },
    //                       children: [
    //                         Div(
    //                           attributes: {
    //                             'class': 'carousel',
    //                             'id': 'main-carousel'
    //                           },
    //                           children: [
    //                             Div(
    //                               attributes: {
    //                                 'class': 'carousel-inner',
    //                                 'id': 'carousel-inner'
    //                               },
    //                             ),
    //                             Button(
    //                               attributes: {
    //                                 'class': 'carousel-btn',
    //                                 'onclick': 'prevSlide()',
    //                                 'style': 'left:10px;'
    //                               },
    //                               children: [RawText('&#10094;')],
    //                             ),
    //                             Button(
    //                               attributes: {
    //                                 'class': 'carousel-btn',
    //                                 'onclick': 'nextSlide()',
    //                                 'style': 'right:10px;'
    //                               },
    //                               children: [RawText('&#10095;')],
    //                             ),
    //                           ],
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'class': 'h-scroll',
    //                             'id': 'thumbnail-row',
    //                             'style': 'margin-top:10px; gap:10px;'
    //                           },
    //                         ),
    //                       ],
    //                     ),

    //                     Div(
    //                       attributes: {
    //                         'class': 'details-container hidden',
    //                         'id': 'details-section'
    //                       },
    //                       children: [
    //                         H1(
    //                           attributes: {'id': 'p-name'},
    //                           children: [BData(value: 'post.title')],
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'id': 'p-sku',
    //                             'style': 'font-size:0.75rem; color:#888; margin-bottom:10px;'
    //                           },
    //                         ),
    //                         Div(
    //                           attributes: {'class': 'price', 'id': 'p-price'},
    //                           children: [Text('--')],
    //                         ),
    //                         P(
    //                           attributes: {
    //                             'id': 'p-desc',
    //                             'style': 'color:#666;'
    //                           },
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'class': 'variants',
    //                             'id': 'p-variants'
    //                           },
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'id': 'p-order-info',
    //                             'style': 'margin-top:20px; padding:15px; background:#f9f9f9; border-radius:8px; display:none;'
    //                           },
    //                           children: [
    //                             H4(
    //                               attributes: {'style': 'margin:0 0 10px;'},
    //                               children: [Text('Order & Delivery Information')],
    //                             ),
    //                             Div(attributes: {'id': 'order-info-list', 'style': 'font-size:0.85rem; line-height:1.8;'}),
    //                           ],
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'id': 'p-specs',
    //                             'style': 'margin-top:20px; display:none;'
    //                           },
    //                           children: [
    //                             H4(
    //                               attributes: {'style': 'margin:0 0 10px; border-bottom:1px solid #eee; padding-bottom:5px;'},
    //                               children: [Text('Product Specifications')],
    //                             ),
    //                             Div(attributes: {'id': 'specs-list', 'style': 'font-size:0.9rem;'}),
    //                           ],
    //                         ),
    //                         Div(
    //                           attributes: {
    //                             'class': 'seller-box',
    //                             'id': 'p-seller'
    //                           },
    //                           children: [
    //                             H4(
    //                               attributes: {'style': 'margin:0 0 10px;'},
    //                               children: [Text('Seller Details')],
    //                             ),
    //                             Div(attributes: {'id': 'seller-info'}),
    //                             Div(
    //                               attributes: {
    //                                 'style': 'display:flex; align-items:center; gap:10px; flex-wrap:wrap;'
    //                               },
    //                               children: [
    //                                 Div(
    //                                   attributes: {
    //                                     'class': 'geo-badge',
    //                                     'id': 'geo-info'
    //                                   },
    //                                   children: [
    //                                     RawText('&#128205; '),
    //                                     Span(
    //                                       attributes: {'id': 'geo-text'},
    //                                       children: [Text('GEO Points Present')],
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 A(
    //                                   attributes: {
    //                                     'class': 'social-link',
    //                                     'id': 'maps-link',
    //                                     'style': 'background:#34495e; display:none;',
    //                                     'target': '_blank'
    //                                   },
    //                                   children: [Text('Open in Maps')],
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),

    //                 Div(
    //                   attributes: {
    //                     'id': 'other-services',
    //                     'style': 'margin-top:50px; display:none;'
    //                   },
    //                   children: [
    //                     H2(
    //                       attributes: {'style': 'margin-bottom:20px;'},
    //                       children: [
    //                         Text('Optional Product-Related Services '),
    //                         DomComponent(
    //                           'small',
    //                           children: [Text('(Additional Charges May Apply)')],
    //                         ),
    //                       ],
    //                     ),
    //                     Div(
    //                       attributes: {
    //                         'class': 'h-scroll',
    //                         'id': 'other-services-list'
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             XmlComment('Content for Parser'),
    //             Div(
    //               attributes: {
    //                 'class': 'hidden',
    //                 'id': 'post-body-raw',
    //                 'style': 'display: none !important;'
    //               },
    //               children: [BData(value: 'post.body')],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),

    //     BIncludable(
    //       id: 'aboutPostAuthor',
    //       children: [
    //         Div(
    //           attributes: {'class': 'author-name'},
    //           children: [
    //             A(
    //               attributes: {
    //                 'class': 'g-profile',
    //                 'expr:href': 'data:post.author.profileUrl',
    //                 'rel': 'author',
    //                 'title': 'author profile'
    //               },
    //               children: [
    //                 Span(children: [BData(value: 'post.author.name')]),
    //               ],
    //             ),
    //           ],
    //         ),
    //         Div(
    //           children: [
    //             Span(
    //               attributes: {'class': 'author-desc'},
    //               children: [BData(value: 'post.author.aboutMe')],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'addComments',
    //       children: [
    //         A(
    //           attributes: {
    //             'expr:href': 'data:post.commentsUrl',
    //             'expr:onclick': 'data:post.commentsUrlOnclick'
    //           },
    //           children: [
    //             BMessage(name: 'messages.postAComment'),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentAuthorAvatar',
    //       children: [
    //         Div(
    //           attributes: {'class': 'avatar-image-container'},
    //           children: [
    //             Img(
    //               attributes: {
    //                 'class': 'author-avatar',
    //                 'expr:src': 'data:comment.authorAvatarSrc',
    //                 'height': '35',
    //                 'width': '35'
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentDeleteIcon',
    //       varName: 'comment',
    //       children: [
    //         Span(
    //           attributes: {'expr:class': '"item-control " + data:comment.adminClass'},
    //           children: [
    //             BIf(
    //               cond: 'data:showCmtPopup',
    //               children: [
    //                 Div(
    //                   attributes: {'class': 'goog-toggle-button'},
    //                   children: [
    //                     Div(attributes: {'class': 'goog-inline-block comment-action-icon'}),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             BElse(),
    //             A(
    //               attributes: {
    //                 'class': 'comment-delete',
    //                 'expr:href': 'data:comment.deleteUrl',
    //                 'expr:title': 'data:messages.deleteComment'
    //               },
    //               children: [
    //                 Img(attributes: {'src': 'https://resources.blogblog.com/img/icon_delete13.gif'}),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentForm',
    //       varName: 'post',
    //       children: [
    //         Div(
    //           attributes: {'class': 'comment-form'},
    //           children: [
    //             A(attributes: {'name': 'comment-form'}),
    //             H4(
    //               attributes: {'id': 'comment-post-message'},
    //               children: [BData(value: 'messages.postAComment')],
    //             ),
    //             BIf(
    //               cond: 'data:this.messages.blogComment != ""',
    //               children: [
    //                 P(children: [BData(value: 'this.messages.blogComment')]),
    //               ],
    //             ),
    //             BInclude(name: 'commentFormIframeSrc', data: 'post'),
    //             DomComponent(
    //               'iframe',
    //               attributes: {
    //                 'allowtransparency': 'allowtransparency',
    //                 'class': 'blogger-iframe-colorize blogger-comment-from-post',
    //                 'expr:height': 'data:cmtIframeInitialHeight ?: "90px"',
    //                 'frameborder': '0',
    //                 'id': 'comment-editor',
    //                 'name': 'comment-editor',
    //                 'src': '',
    //                 'width': '100%'
    //               },
    //             ),
    //             BData(value: 'post.cmtfpIframe'),
    //             Script(
    //               type: 'text/javascript',
    //               content: "BLOG_CMT_createIframe('\" + data:post.appRpcRelayPath + \"');",
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentFormIframeSrc',
    //       varName: 'post',
    //       children: [
    //         A(attributes: {'expr:href': 'data:post.commentFormIframeSrc', 'id': 'comment-editor-src'}),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentItem',
    //       varName: 'comment',
    //       children: [
    //         Div(
    //           attributes: {
    //             'class': 'comment',
    //             'expr:id': '"c" + data:comment.id'
    //           },
    //           children: [
    //             BInclude(cond: 'data:blog.enabledCommentProfileImages', name: 'commentAuthorAvatar'),
    //             Div(
    //               attributes: {'class': 'comment-block'},
    //               children: [
    //                 Div(
    //                   attributes: {'class': 'comment-author'},
    //                   children: [
    //                     BIf(
    //                       cond: 'data:comment.authorUrl',
    //                       children: [
    //                         BMessage(
    //                           name: 'messages.authorSaidWithLink',
    //                           children: [
    //                             BParam(exprValue: 'data:comment.author', value: 'authorName'),
    //                             BParam(exprValue: 'data:comment.authorUrl', value: 'authorUrl'),
    //                           ],
    //                         ),
    //                         BElse(),
    //                         BMessage(
    //                           name: 'messages.authorSaid',
    //                           children: [
    //                             BParam(exprValue: 'data:comment.author', value: 'authorName'),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Div(
    //                   attributes: {
    //                     'expr:class': '"comment-body" + (data:comment.isDeleted ? " deleted" : "")'
    //                   },
    //                   children: [BData(value: 'comment.body')],
    //                 ),
    //                 Div(
    //                   attributes: {'class': 'comment-footer'},
    //                   children: [
    //                     Span(
    //                       attributes: {'class': 'comment-timestamp'},
    //                       children: [
    //                         A(
    //                           attributes: {
    //                             'expr:href': 'data:comment.url',
    //                             'title': 'comment permalink'
    //                           },
    //                           children: [BData(value: 'comment.timestamp')],
    //                         ),
    //                         BInclude(data: 'comment', name: 'commentDeleteIcon'),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentList',
    //       varName: 'comments',
    //       children: [
    //         Div(
    //           attributes: {'id': 'comments-block'},
    //           children: [
    //             BLoop(
    //               values: 'data:comments',
    //               varName: 'comment',
    //               children: [
    //                 BInclude(data: 'comment', name: 'commentItem'),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentPicker',
    //       varName: 'post',
    //       children: [
    //         BIf(
    //           cond: 'data:post.showThreadedComments',
    //           children: [
    //             BInclude(name: 'threadedComments', data: 'post'),
    //           ],
    //         ),
    //         BElse(),
    //         BInclude(name: 'comments', data: 'post'),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'comments',
    //       varName: 'post',
    //       children: [
    //         Section(
    //           attributes: {
    //             'expr:class': '"comments" + (data:post.embedCommentForm ? " embed" : "")',
    //             'expr:data-num-comments': 'data:post.numberOfComments',
    //             'id': 'comments'
    //           },
    //           children: [
    //             A(attributes: {'name': 'comments'}),
    //             BIf(
    //               cond: 'data:post.allowComments',
    //               children: [
    //                 BInclude(name: 'commentsTitle'),
    //                 Div(
    //                   attributes: {'expr:id': 'data:widget.instanceId + "_comments-block-wrapper"'},
    //                   children: [
    //                     BInclude(cond: 'data:post.comments', data: 'post.comments', name: 'commentList'),
    //                   ],
    //                 ),
    //                 BIf(
    //                   cond: 'data:post.commentPagingRequired',
    //                   children: [
    //                     Div(
    //                       attributes: {'class': 'paging-control-container'},
    //                       children: [
    //                         BIf(
    //                           cond: 'data:post.hasOlderLinks',
    //                           children: [
    //                             A(
    //                               attributes: {
    //                                 'expr:class': 'data:post.oldLinkClass',
    //                                 'expr:href': 'data:post.oldestLinkUrl'
    //                               },
    //                               children: [BData(value: 'messages.oldest')],
    //                             ),
    //                             A(
    //                               attributes: {
    //                                 'expr:class': 'data:post.oldLinkClass',
    //                                 'expr:href': 'data:post.olderLinkUrl'
    //                               },
    //                               children: [BData(value: 'messages.older')],
    //                             ),
    //                           ],
    //                         ),
    //                         Span(
    //                           attributes: {'class': 'comment-range-text'},
    //                           children: [BData(value: 'post.commentRangeText')],
    //                         ),
    //                         BIf(
    //                           cond: 'data:post.hasNewerLinks',
    //                           children: [
    //                             A(
    //                               attributes: {
    //                                 'expr:class': 'data:post.newLinkClass',
    //                                 'expr:href': 'data:post.newerLinkUrl'
    //                               },
    //                               children: [BData(value: 'messages.newer')],
    //                             ),
    //                             A(
    //                               attributes: {
    //                                 'expr:class': 'data:post.newLinkClass',
    //                                 'expr:href': 'data:post.newestLinkUrl'
    //                               },
    //                               children: [BData(value: 'messages.newest')],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Div(
    //                   attributes: {'class': 'footer'},
    //                   children: [
    //                     BIf(
    //                       cond: 'data:post.embedCommentForm',
    //                       children: [
    //                         BIf(
    //                           cond: 'data:post.allowNewComments',
    //                           children: [
    //                             BInclude(data: 'post', name: 'commentForm'),
    //                           ],
    //                         ),
    //                         BElse(),
    //                         BData(value: 'post.noNewCommentsText'),
    //                       ],
    //                     ),
    //                     BElse(),
    //                     BIf(
    //                       cond: 'data:post.allowComments',
    //                       children: [
    //                         BInclude(data: 'post', name: 'addComments'),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             BIf(
    //               cond: 'data:showCmtPopup',
    //               children: [
    //                 Div(
    //                   attributes: {'id': 'comment-popup'},
    //                   children: [
    //                     DomComponent(
    //                       'iframe',
    //                       attributes: {
    //                         'allowtransparency': 'allowtransparency',
    //                         'frameborder': '0',
    //                         'id': 'comment-actions',
    //                         'name': 'comment-actions',
    //                         'scrolling': 'no'
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'commentsTitle',
    //       children: [
    //         H3(
    //           attributes: {'class': 'title'},
    //           children: [BData(value: 'messages.comments')],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'threadedCommentForm',
    //       varName: 'post',
    //       children: [
    //         Div(
    //           attributes: {'class': 'comment-form'},
    //           children: [
    //             A(attributes: {'name': 'comment-form'}),
    //             H4(
    //               attributes: {'id': 'comment-post-message'},
    //               children: [BData(value: 'messages.postAComment')],
    //             ),
    //             BIf(
    //               cond: 'data:this.messages.blogComment != ""',
    //               children: [
    //                 P(children: [BData(value: 'this.messages.blogComment')]),
    //               ],
    //             ),
    //             BInclude(name: 'commentFormIframeSrc', data: 'post'),
    //             DomComponent(
    //               'iframe',
    //               attributes: {
    //                 'allowtransparency': 'allowtransparency',
    //                 'class': 'blogger-iframe-colorize blogger-comment-from-post',
    //                 'expr:height': 'data:cmtIframeInitialHeight ?: "90px"',
    //                 'frameborder': '0',
    //                 'id': 'comment-editor',
    //                 'name': 'comment-editor',
    //                 'src': '',
    //                 'width': '100%'
    //               },
    //             ),
    //             BData(value: 'post.cmtfpIframe'),
    //             Script(
    //               type: 'text/javascript',
    //               content: "BLOG_CMT_createIframe('\" + data:post.appRpcRelayPath + \"');",
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'threadedCommentJs',
    //       varName: 'post',
    //       children: [
    //         DomComponent(
    //           'script',
    //           attributes: {
    //             'async': 'async',
    //             'expr:src': 'data:post.commentSrc',
    //             'type': 'text/javascript'
    //           },
    //         ),
    //         BTemplateScript(name: 'threaded_comments', version: '1.0.0'),
    //         Script(
    //           type: 'text/javascript',
    //           content: "blogger.widgets.blog.initThreadedComments(\" + data:post.commentJso + \", \" + data:post.commentMsgs + \", \" + data:post.commentConfig + \");",
    //         ),
    //       ],
    //     ),
    //     BIncludable(
    //       id: 'threadedComments',
    //       varName: 'post',
    //       children: [
    //         Section(
    //           attributes: {
    //             'class': 'comments threaded',
    //             'expr:data-embed': 'data:post.embedCommentForm',
    //             'expr:data-num-comments': 'data:post.numberOfComments',
    //             'id': 'comments'
    //           },
    //           children: [
    //             A(attributes: {'name': 'comments'}),
    //             BInclude(name: 'commentsTitle'),
    //             Div(
    //               attributes: {'class': 'comments-content'},
    //               children: [
    //                 BIf(
    //                   cond: 'data:post.embedCommentForm',
    //                   children: [
    //                     BInclude(data: 'post', name: 'threadedCommentJs'),
    //                   ],
    //                 ),
    //                 Div(
    //                   attributes: {'id': 'comment-holder'},
    //                   children: [BData(value: 'post.commentHtml')],
    //                 ),
    //               ],
    //             ),
    //             P(
    //               attributes: {'class': 'comment-footer'},
    //               children: [
    //                 BIf(
    //                   cond: 'data:post.allowNewComments',
    //                   children: [
    //                     BInclude(data: 'post', name: 'threadedCommentForm'),
    //                   ],
    //                 ),
    //                 BElse(),
    //                 BData(value: 'post.noNewCommentsText'),
    //                 BIf(
    //                   cond: 'data:post.showManageComments',
    //                   children: [
    //                     BInclude(name: 'manageComments', data: 'post'),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             BIf(
    //               cond: 'data:showCmtPopup',
    //               children: [
    //                 Div(
    //                   attributes: {'id': 'comment-popup'},
    //                   children: [
    //                     DomComponent(
    //                       'iframe',
    //                       attributes: {
    //                         'allowtransparency': 'allowtransparency',
    //                         'frameborder': '0',
    //                         'id': 'comment-actions',
    //                         'name': 'comment-actions',
    //                         'scrolling': 'no'
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
  ],
);
