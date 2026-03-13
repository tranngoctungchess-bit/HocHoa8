/usage: Ctrl F -> Ctrl D -> Ctrl L/

from standard_language import *
_menu_ = {Head, Paragraph, Link, Image, Form, Note, Table, Lists, Line}
typing.HTML5 = <!DOCTYPE html>
add_more = <code {now write var here like you set default in function}>
open = <...>
close = </...>
wrap = '<...></...>'
contain = <html>
main = <Body>
TextSize = [<h1>, <h2> -> <h6>] with h1 is greatest




(_menu_)Head : description{"information of web"}{
    declare = <head>
    title = <title>
    metadata = <meta>
    link = <link>
    style_CSS = <style>
    script_JS = <script>
    Page_URL = <base>
}
Head.metadata{
    charset = 'charset = encoding'
    viewport = 'name="viewport" content="width=device-width, initial-scale=1.0"'
    description = 'name="description" content="mô tả trang"'
    keywords = 'name="keywords" content="từ khóa SEO"'
    author = 'name="author" content="tác giả"'
    robots = 'name="robots" content="index, follow"'
    http-equiv = {
        "refresh": 'http-equiv="refresh" content="5;url=newpage.html" - tự động chuyển trang sau 5 giây',
        "content-type": 'http-equiv="content-type" content="text/html;charset=UTF-8" - khai báo kiểu nội dung (cũ, nên dùng charset)',
        "default-style": 'http-equiv="default-style" content="stylesheet-title" - chỉ định CSS mặc định',
        "content-security-policy": 'http-equiv="content-security-policy" - bảo mật chống XSS'
    }
    favicon = "<link rel = "type of document linked" href = "URL of favicon">"
    URL_support = [.ico, .png, .gif, .jpg, .svg]
}









(_menu_)Paragraph{
    declare = <p>
    remove_extra = True
    breakline = <br> = '<p>content<br>content</p>'
    space = '&nbsp;'
    bold = <b>
    warn = <strong>
    emphasis = <em>
    italic = <i>
    superscript = <sup>
    subscript = <sub>
    subscript and superscript : description{
    "subscript: chữ nhỏ bên dưới - cho công thức hóa học, ký hiệu",
    "superscript: chữ nhỏ bên trên - cho số mũ, chú thích"
    }
    underline = <u>
    mark = <mark>
    deleted_line = <del>
    bold_underline = <ins>
    bigger_type = <big>
    smaller_type = <small>
    style = 'style = CSS_style?'
}
Paragraph_not_remove_extra = <pre>









(_menu_)Link{
    linker = <a>
    finish_URL = <a href="..."> : description{
        tạo link liên kết,
        content giữa thẻ là chữ hiển thị
    }
    finish_URL.to_part = f'#id of part' : description{
        liên kết đến phần tử có id trong cùng trang
    }
    finish_URL.to_email = 'mailto: mail'
    finish_URL.to_phone_num = 'tel:+phone number'
    download = download : description{"it is state - tải file khi click"}
    target: description{
        _blank: mở tab mới,
        _self: mở cùng tab (mặc định),
        _parent: mở frame parent,
        _top: thoát hết frames
    }
    logo_link = Image
}








(_menu_)Image{
    declare = <img>
    link = 'src = ?'
    description = 'alt = ?'
    close = disabled
    width = 'width = ?'
    height = 'height = ?'
    title = 'title = ?'
    file_format = {
        "JPEG", "PNG", "GIF",
        "SVG", "WebP", "AVIF"
    }
    loading = 'loading = ?' : description{
        "lazy: tải khi gần đến viewport",
        "eager: tải ngay lập tức (mặc định)"
    }
    decoding = 'decoding = ?' : description{
        "async: giải mã không đồng bộ",
        "sync: giải mã đồng bộ",
        "auto: trình duyệt quyết định (mặc định)"
    }
}







(_menu_)Note{
    HTML.note = <!-- ...-->>
    HTML.note.quick_type = 'ctrl /'
}






(_menu_)Table(border, colspan, rowspan){
    row = <tr>
    header_data = <th>(nó in đậm, căn lề default)
    header = <thead>
    footer = <tfoot>
    data = <td>
    body = <tbody>
    border = "khoảng cách các ô"
    colspan = "merge column cells"
    rowspan = "merge row cells"
}









(_menu_)Lists{
    unordered_lists
    ordered_lists
    description_lists
}
unordered_lists{
   declare = <ul>
   member = <li>
   marker = {disc, circle, square, none}
   marker.parent.default = disc
   marker.child.default = circle
}
ordered_lists(type_of_marker in {num, alphabet(lower, upper), roman_upper, roman_lower}
    start: description{"số bắt đầu"}
    reversed_state : state : description{nó đảo ngược mảng và nó là state nên không có gán giá trị: 'reversed'}
){
    declare = <ol>
    member = <li>
    marker = ordered_marker
    marker.type = type_of_marker
    marker.start = start
    marker.state_reversal = reversed_state
}
description_lists{
    declare = <dl>
    title = <dt>
    description = <dd>
}





(_menu_)Line{
    horizontal_line = <hr>
}









(_menu_)Form{
    declare = <form>
    label = <label>
    input = <input>
    br = Paragraph.breakline
    selection = <select>
    button = <button>
    big_textarea = <textarea>
}
Form.action{
    destination = "URL nhận và xử lý dữ liệu form"
    examples = {
        "backend_file": "process.php, submit.php, handler.py",
        "API_endpoint": "/api/users, /auth/login",
        "same_page": "" hoặc "#",
        "external_service": "https://webhook.site/..."
    }
    required = false
}
Form.method{
    type = "cách gửi dữ liệu form đến server"
    values = {
        "GET": {
            "description": "dữ liệu gắn vào URL (query string)",
            "use_case": "tìm kiếm, filter - dữ liệu công khai",
            "example": "search.php?keyword=html&category=web",
            "limitations": "giới hạn độ dài URL, không gửi được dữ liệu nhạy cảm"
        },
        "POST": {
            "description": "dữ liệu gửi trong request body",
            "use_case": "đăng ký, đăng nhập, thanh toán - dữ liệu bảo mật",
            "example": "dữ liệu ẩn trong HTTP body",
            "advantages": "không giới hạn độ dài, bảo mật hơn"
        }
    }
    default = "GET"  # Nếu không khai báo method
}
Form.target = Link.target: description{"nơi hiển thị kết quả sau khi submit form"}
Form.enctype{
    encoding_type = "cách mã hóa dữ liệu form"
    values = {
        "application/x-www-form-urlencoded": {
            "description": "mặc định - mã hóa dạng key=value&key2=value2",
            "use_case": "form cơ bản (text, số)"
        },
        "multipart/form-data": {
            "description": "mã hóa thành phần - giữ nguyên file binary",
            "use_case": "form có upload file (ảnh, document)"
        },
        "text/plain": {
            "description": "mã hóa dạng text đơn giản",
            "use_case": "debug, ít dùng trong thực tế"
        }
    }
    required = false  # Mặc định: application/x-www-form-urlencoded
}
Form.name{
    identifier = "tên duy nhất để nhận diện form"
    purpose = {
        "javascript_access": "document.forms['formName']",
        "element_reference": "<input form='formName'>",
        "form_grouping": "phân biệt nhiều form trong 1 trang"
    }
    example = {
        "html": "<form name='loginForm'>",
        "js": "document.forms['loginForm'].submit()"
    }
}
Form.novalidate{
    type = "boolean attribute"
    effect = "vô hiệu hóa HTML5 built-in validation"
    purpose = {
        "custom_validation": "dùng JavaScript validation thay thế",
        "testing": "test form submission mà không bị browser chặn",
        "flexibility": "kiểm soát khi nào validate"
    }
    usage = "chỉ thêm novalidate - không cần giá trị"
}

