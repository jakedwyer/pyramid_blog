<%inherit file="pyramid_blog:templates/layout.mako"/>

<h1>${entry.title}</h1>
<hr/>
<p>${entry.body}</p>
<hr/>
<p>Created <strong title="${entry.created}">
${entry.created_in_words}</strong> ago </p>

<p><a href="${request.route_url('home')}">Go back</a> ::
<a href="${request.route_url('blog_action', action='edit',
_query=(('id',entry.if),))}">Edit Entry</a>

</p>