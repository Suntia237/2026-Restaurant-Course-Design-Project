package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@WebServlet("/addMenu")
@MultipartConfig(
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 20 * 1024 * 1024
)
public class AddMenu extends BaseServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        loadPage(
                req,
                resp,
                "Add Menu",
                "/view/admin/add-menu.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }

    private static final String UPLOAD_DIR = "images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * Get form data
         */
        String menuName = req.getParameter("menuName");
        int price = Integer.parseInt(req.getParameter("price"));
        String category = req.getParameter("category");
        String imgURL = uploadImg(req,resp);

        Menu newMenu = new Menu(menuName,price,category,imgURL);
        MenuDao menuDao = new MenuDaoImpl();

        boolean success = menuDao.addMenu(newMenu);
        if(!success){
            req.setAttribute("error", "Unable to add menu");
            loadPage(
                    req,
                    resp,
                    "Add Menu",
                    "/view/admin/add-menu.jsp",
                    BaseServlet.ADMIN_LAYOUT
            );
        }else{
            req.setAttribute("success","Menu added successfully");
            loadPage(
                    req,
                    resp,
                    "Add Menu",
                    "/view/admin/add-menu.jsp",
                    BaseServlet.ADMIN_LAYOUT
            );
        }
    }

    private String uploadImg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part filePart = req.getPart("myFile");
        if (filePart == null || filePart.getSize() == 0) {
            resp.getWriter().write("No image uploaded");
            return "orange.png";
        }

        String originalFileName = getSubmittedFileName(filePart);

        String ext = "";
        int dotIndex = originalFileName.lastIndexOf(".");
        if (dotIndex > 0) {
            ext = originalFileName.substring(dotIndex);
        }
        String newFileName = UUID.randomUUID().toString() + ext;

        String appPath = req.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        System.out.println("File upload path：" + uploadPath);
        String filePath = uploadPath + File.separator + newFileName;
        try (InputStream in = filePart.getInputStream();
             FileOutputStream out = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[8192];
            int len;
            while ((len = in.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
        }
        return newFileName;
    }

    private String getSubmittedFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                String fileName = token.substring(token.indexOf('=') + 1).trim();
                if (fileName.startsWith("\"")) {
                    fileName = fileName.substring(1, fileName.length() - 1);
                } else if (fileName.startsWith("'")) {
                    fileName = fileName.substring(1, fileName.length() - 1);
                }

                int lastSlash = fileName.lastIndexOf("\\");
                if (lastSlash != -1) {
                    fileName = fileName.substring(lastSlash + 1);
                }
                return fileName;
            }
        }
        return "unknown";
    }

}
