<%inherit file="pyramid_blog:templates/layout.mako"/>

<form action="${request.route_url('blog_action',action=action)}" method="post">
%if action =='edit':
${form.id()}
%endif

% for error in form.title.errors:
	<div class="error">${ error }</div>
% endfor

<div><label>${form.body.label}</label>${form.title()}</div>

% for error in form.body.errors:
<div class="error">${error}</div>
% endfor

<div><label>${form.body.label}</label>${form.body()}</div>
<div><input type="submit" value="Submit"></div>
</form>
<p><a href="${request.route_url('home')}">Go Back</a></p>

<style type="text/css">
form{
	text-align: right;
}
label{
	min-width: 150px;
	vertical-align: top;
	text-align: right;
	display: inline-block;
	}
input[type=text]{
	min-width: 50px;
	}
textarea{
	color: #222;
	border: 1px solid #CCC;
	font-family: sans-serif;
	