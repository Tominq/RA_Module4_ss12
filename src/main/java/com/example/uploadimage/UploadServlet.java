package com.example.uploadimage;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UploadImage", value = "/UploadImage")
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action!=null && action.equals("upload")){
            // Get the upload destination path
            String uploadPath = getServletContext().getRealPath("/uploads"); // Get the ServletContext object
            File file = new File(uploadPath);
            if(!file.exists()){
                file.mkdirs(); // Create the directory
            }

            List<String> filenames = new ArrayList<>();
            // Get the list of uploaded files
            Collection<Part> fileList = req.getParts();
            for (Part p: fileList) {
                if(p.getName().equals("image")){
                    // Upload image
                    String fileName = p.getSubmittedFileName();
                    p.write(uploadPath+File.separator+fileName);
                    filenames.add(fileName);
                }else if (p.getName().equals("avatar")){
                    // Upload avatar
                    String fileName = p.getSubmittedFileName();
                    p.write(uploadPath+File.separator+fileName);
                    filenames.add(fileName);
                }
            }
            // Send the image links
            req.setAttribute("images",filenames);
            req.getRequestDispatcher("/WEB-INF/view-image.jsp").forward(req,resp);
        }
    }
}