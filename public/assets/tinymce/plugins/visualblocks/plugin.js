tinymce.PluginManager.add("visualblocks",function(e,s){function o(){var s=this;s.active(a),e.on("VisualBlocks",function(){s.active(e.dom.hasClass(e.getBody(),"mce-visualblocks"))})}var l,t,a;window.NodeList&&(e.addCommand("mceVisualBlocks",function(){var o,c=e.dom;l||(l=c.uniqueId(),o=c.create("link",{id:l,rel:"stylesheet",href:s+"/css/visualblocks.css"}),e.getDoc().getElementsByTagName("head")[0].appendChild(o)),e.on("PreviewFormats AfterPreviewFormats",function(s){a&&c.toggleClass(e.getBody(),"mce-visualblocks","afterpreviewformats"==s.type)}),c.toggleClass(e.getBody(),"mce-visualblocks"),a=e.dom.hasClass(e.getBody(),"mce-visualblocks"),t&&t.active(c.hasClass(e.getBody(),"mce-visualblocks")),e.fire("VisualBlocks")}),e.addButton("visualblocks",{title:"Show blocks",cmd:"mceVisualBlocks",onPostRender:o}),e.addMenuItem("visualblocks",{text:"Show blocks",cmd:"mceVisualBlocks",onPostRender:o,selectable:!0,context:"view",prependToContext:!0}),e.on("init",function(){e.settings.visualblocks_default_state&&e.execCommand("mceVisualBlocks",!1,null,{skip_focus:!0})}),e.on("remove",function(){e.dom.removeClass(e.getBody(),"mce-visualblocks")}))});