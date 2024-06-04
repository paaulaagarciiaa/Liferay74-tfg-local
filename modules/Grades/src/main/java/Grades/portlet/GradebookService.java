package Grades.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import org.osgi.service.component.annotations.Component;

@Component(
        immediate = true,
        service = GradebookService.class
)
public class GradebookService {
    private static final Log _log = LogFactoryUtil.getLog(GradebookService.class);

    public String[] getGrades(long userId, long groupId) {
        // Retorna un ejemplo de notas
        return new String[]{"90", "85", "95"};
    }

}
