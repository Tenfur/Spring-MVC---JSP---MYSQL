package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import Config.ConnectionDatabase;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import Entities.Person;
import Entities.Book;
//import Entities.Search;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerMain {
    ConnectionDatabase connection = new ConnectionDatabase();
    JdbcTemplate jdbTemplate = new JdbcTemplate(connection.get_connection());
    ModelAndView mav = new ModelAndView();
    List data;
    int id, idBook;
    
    @RequestMapping("index.htm")
    public ModelAndView Index(){
        mav.setViewName("index");
        return mav;
    }
    // User
    @RequestMapping("users.htm")
    public ModelAndView ListUsers(){
        String sql = "select users.id, users.name, users.email, users.country,\n" +
                    "case \n" +
                    "	when count(books.idUser) > 0 then count(*)\n" +
                    "    when count(books.idUser) = 0 then 0\n" +
                    "end as 'numberBooks'\n" +
                    "from users left join books on users.id = books.idUser\n" +
                    "group by users.id";
        data = this.jdbTemplate.queryForList(sql);
        mav.addObject("list", data);
        mav.setViewName("users");
        return mav;
    }
    @RequestMapping(value = "add.htm", method = RequestMethod.GET)
    public ModelAndView Add(){
        mav.addObject(new Person());
        mav.setViewName("add");
        return mav;
    }
    @RequestMapping(value = "add.htm", method = RequestMethod.POST)
    public ModelAndView Add(Person p){
        String sql = "insert into users(name, email, country) values(?,?,?)";
        this.jdbTemplate.update(sql, p.getName(), p.getEmail(), p.getCountry());
        return new ModelAndView("redirect:/users.htm");
    }
    @RequestMapping(value = "update.htm", method = RequestMethod.GET)
    public ModelAndView Update(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from users where id ="+id;
        data = this.jdbTemplate.queryForList(sql);
        mav.addObject("user",data);
        mav.setViewName("update");
        return mav;
    }
    @RequestMapping(value = "update.htm", method = RequestMethod.POST)
    public ModelAndView Update(Person p){
        String sql = "update users set name=?, email=?, country=? where id =?";
        this.jdbTemplate.update(sql, p.getName(), p.getEmail(),p.getCountry(), id);
        return new ModelAndView("redirect:/users.htm");
    }
    @RequestMapping(value = "delete.htm")
    public ModelAndView Delete(HttpServletRequest request){
         id = Integer.parseInt(request.getParameter("id"));
         String sql = "delete from users where id = ?";
         this.jdbTemplate.update(sql, id);
         return new ModelAndView("redirect:/users.htm");
    }

    // Book
    @RequestMapping("books.htm")
    public ModelAndView ListBooks(){
        String sql = "select books.id, books.name, books.price, books.description, books.imageUrl,users.name as 'nameUser', users.email, categories.nameCategory from books inner join users on books.idUser = users.id inner join categories on books.idCategory = categories.id";
        List dataBooks = this.jdbTemplate.queryForList(sql);
        mav.addObject("list", dataBooks);
        mav.setViewName("books");
        return mav;
    }
    @RequestMapping(value = "deleteBook.htm")
    public ModelAndView DeleteBook(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "delete from books where id = ?";
        this.jdbTemplate.update(sql, id);
        return new ModelAndView("redirect:/books.htm");
    }
    @RequestMapping(value = "addBook.htm", method = RequestMethod.GET)
    public ModelAndView AddBook(){
        String sql = "select id, name from users";
        String sql2 = "select * from categories";
        List dataUsers = this.jdbTemplate.queryForList(sql);
        List dataCategories = this.jdbTemplate.queryForList(sql2);
        mav.addObject("users",dataUsers);
        mav.addObject("categories", dataCategories);
        mav.addObject(new Book());
        mav.setViewName("addBook");
        return mav;
    }
    @RequestMapping(value ="addBook.htm", method = RequestMethod.POST)
    public ModelAndView AddBook(Book book){
        System.out.println(book);
        String sql = "insert into books(name, price, idUser, imageUrl, description, idCategory) values(?, ?, ?, ?,?,?)";
        this.jdbTemplate.update(sql, book.getName(), book.getPrice(), book.getIdUser(), book.getImageUrl(), book.getDescription(), book.getIdCategory());
        return new ModelAndView("redirect:/books.htm");
    }
    @RequestMapping(value = "updateBook.htm", method = RequestMethod.GET)
    public ModelAndView UpdateBook(HttpServletRequest request){
        idBook = Integer.parseInt(request.getParameter("id"));
        String sql = "select books.id, books.name, books.price, books.description, books.imageUrl,users.name as 'nameUser', users.email, categories.nameCategory, categories.id as 'idCategory', users.id as 'idUser'\n" +
                    "from books inner join users on books.idUser = users.id\n" +
                    "inner join categories on books.idCategory = categories.id\n" +
                    "where books.id = ?";
        String sql2 = "select * from users";
        String sql3 = "select * from categories";
        List data = this.jdbTemplate.queryForList(sql, idBook);
        List dataUsers = this.jdbTemplate.queryForList(sql2);
        List dataCategories = this.jdbTemplate.queryForList(sql3);
        mav.addObject("book", data);
        mav.addObject("users", dataUsers);
        mav.addObject("categories", dataCategories);
        mav.setViewName("updateBook");
        return mav;
    }
    @RequestMapping(value = "updateBook.htm", method = RequestMethod.POST)
    public ModelAndView UpdateBook(Book b){
        String sql = "update books set name = ?, price = ?, idUser = ?, imageUrl = ?, description = ?, idCategory = ? where id = ?";
        this.jdbTemplate.update(sql, b.getName(), b.getPrice(), b.getIdUser(), b.getImageUrl(), b.getDescription(), b.getIdCategory(), idBook);
        return new ModelAndView("redirect:/books.htm");
    }
    /*// Search
    @RequestMapping(value = "searchbook.htm", method = RequestMethod.GET)
    public ModelAndView SearchBook(Search s){
        String sql = "select * from books where like ?";
        List dataBookSearch = this.jdbTemplate.queryForList(sql, s.getSearchBook());
        mav.addObject("book", dataBookSearch);
        mav.setViewName("searchbook");
        return mav;
    }*/
    
}
