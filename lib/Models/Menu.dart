class Menu {
  int iD;
  String postAuthor;
  String postDate;
  String postDateGmt;
  String postContent;
  String postTitle;
  String postExcerpt;
  String postStatus;
  String commentStatus;
  String pingStatus;
  String postPassword;
  String postName;
  String toPing;
  String pinged;
  String postModified;
  String postModifiedGmt;
  String postContentFiltered;
  int postParent;
  String guid;
  int menuOrder;
  String postType;
  String postMimeType;
  String commentCount;
  String filter;
  int dbId;
  String menuItemParent;
  String objectId;
  String object;
  String type;
  String typeLabel;
  String url;
  String title;
  String target;
  String attrTitle;
  String description;
  List<String> classes;
  String xfn;

  Menu(
      {this.iD,
        this.postAuthor,
        this.postDate,
        this.postDateGmt,
        this.postContent,
        this.postTitle,
        this.postExcerpt,
        this.postStatus,
        this.commentStatus,
        this.pingStatus,
        this.postPassword,
        this.postName,
        this.toPing,
        this.pinged,
        this.postModified,
        this.postModifiedGmt,
        this.postContentFiltered,
        this.postParent,
        this.guid,
        this.menuOrder,
        this.postType,
        this.postMimeType,
        this.commentCount,
        this.filter,
        this.dbId,
        this.menuItemParent,
        this.objectId,
        this.object,
        this.type,
        this.typeLabel,
        this.url,
        this.title,
        this.target,
        this.attrTitle,
        this.description,
        this.classes,
        this.xfn});

  Menu.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postAuthor = json['post_author'];
    postDate = json['post_date'];
    postDateGmt = json['post_date_gmt'];
    postContent = json['post_content'];
    postTitle = json['post_title'];
    postExcerpt = json['post_excerpt'];
    postStatus = json['post_status'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    postPassword = json['post_password'];
    postName = json['post_name'];
    toPing = json['to_ping'];
    pinged = json['pinged'];
    postModified = json['post_modified'];
    postModifiedGmt = json['post_modified_gmt'];
    postContentFiltered = json['post_content_filtered'];
    postParent = json['post_parent'];
    guid = json['guid'];
    menuOrder = json['menu_order'];
    postType = json['post_type'];
    postMimeType = json['post_mime_type'];
    commentCount = json['comment_count'];
    filter = json['filter'];
    dbId = json['db_id'];
    menuItemParent = json['menu_item_parent'];
    objectId = json['object_id'];
    object = json['object'];
    type = json['type'];
    typeLabel = json['type_label'];
    url = json['url'];
    title = json['title'];
    target = json['target'];
    attrTitle = json['attr_title'];
    description = json['description'];
    classes = json['classes'].cast<String>();
    xfn = json['xfn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['post_author'] = this.postAuthor;
    data['post_date'] = this.postDate;
    data['post_date_gmt'] = this.postDateGmt;
    data['post_content'] = this.postContent;
    data['post_title'] = this.postTitle;
    data['post_excerpt'] = this.postExcerpt;
    data['post_status'] = this.postStatus;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['post_password'] = this.postPassword;
    data['post_name'] = this.postName;
    data['to_ping'] = this.toPing;
    data['pinged'] = this.pinged;
    data['post_modified'] = this.postModified;
    data['post_modified_gmt'] = this.postModifiedGmt;
    data['post_content_filtered'] = this.postContentFiltered;
    data['post_parent'] = this.postParent;
    data['guid'] = this.guid;
    data['menu_order'] = this.menuOrder;
    data['post_type'] = this.postType;
    data['post_mime_type'] = this.postMimeType;
    data['comment_count'] = this.commentCount;
    data['filter'] = this.filter;
    data['db_id'] = this.dbId;
    data['menu_item_parent'] = this.menuItemParent;
    data['object_id'] = this.objectId;
    data['object'] = this.object;
    data['type'] = this.type;
    data['type_label'] = this.typeLabel;
    data['url'] = this.url;
    data['title'] = this.title;
    data['target'] = this.target;
    data['attr_title'] = this.attrTitle;
    data['description'] = this.description;
    data['classes'] = this.classes;
    data['xfn'] = this.xfn;
    return data;
  }
}
