class DisplayBlog {
  final String date;
  final String title;
  final String description;

  const DisplayBlog(this.title, this.description, this.date);
}

class FullBlog extends DisplayBlog {
  final String body;

  const FullBlog(super.title, super.description, super.date, this.body);

}



