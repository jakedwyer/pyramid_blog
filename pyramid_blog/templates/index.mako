<%inherit file="pyramid_blog:templates/layout.mako"/>
<%
from pyramid.security import authenticated_userid
user_id = authenticated_userid(request)
%>
% if user_id:
	Welcome <strong>${user_id}</strong> ::
	<a href="${request.route_url('auth', action='out')}">Sign Out</a>
%else:
	<form action="${request.route_url('auth', action='in')}" method="post">
	<label>User</label><input type="text" name="username">
	<label>Password</label><input type="text" name="username">
	<input type="submit" value="sign in">
	</form>
%endif

% if paginator.items:

	${paginator.pager()}
	
	<h2>Blog entries</h2>
	
	<ul>
	% for entry in paginator.items:
	<li>
	<a href="${request.route_url('blog', id=entry.id, slug=entry.slug)}">
	${entry.title}</a>
	</li>
	% endfor
	</ul>
	
	${paginator.pager()}
	
% else:

<p>No entries found</p>

%endif

<p><a href="${request.route_url('blog_action', action='create')}">
Create a new blog entry</a></p>