@import java.time.LocalDate

@param String userName
@param int dayOfMonth = 0

!{var actualDayOfMonth = dayOfMonth > 0 ? dayOfMonth : LocalDate.now().getDayOfMonth();}

@template.main(content = @`
    <div>
        <h1>Welcome, ${userName}!</h1>
        <p>Це особиста сторінка.</p>

        @if(actualDayOfMonth % 2 == 0)
            <p>Сьогодні парна дата — ${actualDayOfMonth}. Це особливий день!</p>
        @else
            <p>Сьогодні непарна дата — ${actualDayOfMonth}. Звичайний день.</p>
        @endif

    </div>
`)
