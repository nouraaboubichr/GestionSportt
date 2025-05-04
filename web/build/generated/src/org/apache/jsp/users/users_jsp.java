package org.apache.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entities.User;
import services.UserService;

public final class users_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Liste des Étudiants</title>\n");
      out.write("        <style>\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            body {\n");
      out.write("                background-color: #f5f5f5;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            fieldset {\n");
      out.write("                border: none;\n");
      out.write("                background-color: white;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);\n");
      out.write("                padding: 30px;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 900px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            legend {\n");
      out.write("                font-size: 24px;\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #333;\n");
      out.write("                padding: 0 10px;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            legend::after {\n");
      out.write("                content: '';\n");
      out.write("                display: block;\n");
      out.write("                width: 50px;\n");
      out.write("                height: 3px;\n");
      out.write("                background-color: #4a6fdc;\n");
      out.write("                margin-top: 8px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            table {\n");
      out.write("                width: 100%;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                margin-top: 15px;\n");
      out.write("                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            th, td {\n");
      out.write("                padding: 15px;\n");
      out.write("                text-align: left;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            th {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #444;\n");
      out.write("                position: sticky;\n");
      out.write("                top: 0;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            tbody tr:hover {\n");
      out.write("                background-color: #f9f9f9;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            tbody tr:last-child td {\n");
      out.write("                border-bottom: none;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            a {\n");
      out.write("                text-decoration: none;\n");
      out.write("                padding: 8px 12px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                font-size: 14px;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            a[href*=\"delete\"] {\n");
      out.write("                background-color: #ff5252;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            a[href*=\"delete\"]:hover {\n");
      out.write("                background-color: #e04646;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            a[href*=\"update\"] {\n");
      out.write("                background-color: #4a6fdc;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            a[href*=\"update\"]:hover {\n");
      out.write("                background-color: #3a5fc8;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .empty-message {\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 20px;\n");
      out.write("                color: #666;\n");
      out.write("                font-style: italic;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .actions-container {\n");
      out.write("                display: flex;\n");
      out.write("                gap: 8px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .add-button {\n");
      out.write("                display: inline-block;\n");
      out.write("                background-color: #4CAF50;\n");
      out.write("                color: white;\n");
      out.write("                padding: 10px 15px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-top: 20px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                transition: background-color 0.3s;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .add-button:hover {\n");
      out.write("                background-color: #3e9142;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            @media (max-width: 768px) {\n");
      out.write("                table {\n");
      out.write("                    display: block;\n");
      out.write("                    overflow-x: auto;\n");
      out.write("                    white-space: nowrap;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                fieldset {\n");
      out.write("                    padding: 20px;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                th, td {\n");
      out.write("                    padding: 10px;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                a {\n");
      out.write("                    padding: 6px 10px;\n");
      out.write("                    font-size: 13px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <fieldset>\n");
      out.write("            <legend>Liste des étudiants</legend>\n");
      out.write("            \n");
      out.write("            <table>\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>ID</th>\n");
      out.write("                        <th>Nom</th>\n");
      out.write("                        <th>Prénom</th>\n");
      out.write("                        <th>Email</th>\n");
      out.write("                        <th>Actions</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    ");

                        UserService us = new UserService();
                        java.util.List<User> users = us.findAll();
                        if(users != null && !users.isEmpty()) {
                            for(User u : users){
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( u.getId() );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( u.getNom() );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( u.getEmail() );
      out.write("</td>\n");
      out.write("                        <td class=\"actions-container\">\n");
      out.write("                            <a href=\"../UserController?id=");
      out.print( u.getId());
      out.write("&op=delete\">Supprimer</a>\n");
      out.write("                            <a href=\"../UserController?id=");
      out.print( u.getId());
      out.write("&op=update\">Modifier</a>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
 
                            }
                        } else {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"5\" class=\"empty-message\">Aucun étudiant trouvé</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("            <a href=\"user.jsp\" class=\"add-button\">Ajouter un étudiant</a>\n");
      out.write("        </fieldset>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
